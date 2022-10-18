import string
import requests
import json
from time import time
from dotenv import load_dotenv
from os import environ
from hashlib import md5

def get_timestamp() -> string:
    return str(int(time()))

if __name__ == "__main__":
    load_dotenv()

    MARVEL_URL = "https://gateway.marvel.com:443/v1/public/characters"

    private_key = environ["MARVEL_PRIVATE_KEY"]
    public_key = environ["MARVEL_PUBLIC_KEY"]

    limit = 100
    offset = 0

    count = 1
    while count > 0:
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
        for character in characters:
            print(character["name"])
        offset += limit