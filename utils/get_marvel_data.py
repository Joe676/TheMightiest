import sys
import requests
from time import time
from dotenv import load_dotenv
from os import environ
from hashlib import md5
from Character import Character
from upload_to_firestore import upload_characters

SHOULD_UPLOAD = False

def get_timestamp() -> str:
    return str(int(time()))

def parse_results(results_list: list) -> list[Character]:
    not_allowed_images = ["image_not_available", "4c002e0305708"]
    output = []
    for character in results_list:
        character_id = character["id"]
        name = character["name"]
        thumbnail = character["thumbnail"]
        img_path: str = thumbnail["path"]
        img_extension = thumbnail["extension"]
        
        img_name = img_path.split("/")[-1]
        if img_name in not_allowed_images:
            continue
        output.append(Character(character_id, name, f"{img_path}.{img_extension}", 0, 0))
    return output

def save_characters(characters: list[Character]) -> None:
    lines = []
    for character in characters:
        lines.append(f"{character.name}, {character.picture_url}\n")

    with open("utils/characters.csv", "w", encoding="utf-8") as file:
        file.writelines(lines)

if __name__ == "__main__":
    if "--upload" in sys.argv:
        SHOULD_UPLOAD = True

    load_dotenv()

    MARVEL_URL = "https://gateway.marvel.com:443/v1/public/characters"

    private_key = environ["MARVEL_PRIVATE_KEY"]
    public_key = environ["MARVEL_PUBLIC_KEY"]
    
    all_characters: list[Character] = []

    limit = 100
    offset = 0

    count = 100
    while count >= 100:
        ts = get_timestamp()
        api_hash = md5(f"{ts}{private_key}{public_key}".encode())
        
        response = requests.get(MARVEL_URL, 
            params = {"ts": ts, "apikey": public_key, "hash": api_hash.hexdigest(), "limit": limit, "offset": offset})

        if response:
            print("Success!")
        else:
            print("Error")
            print(response.content)
            exit()
    
        count = response.json()["data"]["count"]

        characters = response.json()["data"]["results"]
        characters = parse_results(characters)
        all_characters.extend(characters)
        
        offset += limit
    save_characters(all_characters)
    if SHOULD_UPLOAD:
        upload_characters(all_characters)