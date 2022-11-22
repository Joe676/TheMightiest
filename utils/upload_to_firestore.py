import firebase_admin
from firebase_admin import credentials, firestore

from Character import Character

cred = credentials.Certificate("firebase_admin_key.json")
app = firebase_admin.initialize_app(cred)
db = firestore.client()

def upload_characters(characters: list[Character]) -> None:
    # batch = db.batch() //batch can take up to 500 adds, but it still uses up one write per document
    characters_collection_ref = db.collection(u'characters')
    print('Uploading to *firebase*...')
    for i, character in enumerate(characters):
        char_ref = characters_collection_ref.document('character-'+str(i))
        char_ref.set(character.__dict__, merge=True)
    print('Uploading finished.')
    # batch.commit()
        
