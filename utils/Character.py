from dataclasses import dataclass

@dataclass
class Character:
    character_id: int
    name: str
    picture_url: str
    votes_for: int
    votes_against: int

if __name__ == '__main__':
    char = Character(100, "iron man", "www.xd.com", 100, 0)
    print(char)
    print(char.__dict__)