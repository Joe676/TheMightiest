import 'package:demo/dataAccess/CharactersDataAccess.dart';

class Character {
  String documentId;
  int characterId;
  String name;
  String imgUrl;
  int votesFor;
  int votesAgainst;

  Character(this.documentId, this.characterId, this.name, this.imgUrl,
      this.votesFor, this.votesAgainst);

  void getVoteFor() {
    votesFor += 1;
    increaseVoteFor(documentId, votesFor);
  }

  void getVoteAgainst() {
    votesAgainst += 1;
    increaseVoteAgainst(documentId, votesAgainst);
  }
}
