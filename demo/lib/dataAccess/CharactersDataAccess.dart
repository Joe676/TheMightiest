//import 'dart:ffi';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/Character.dart';
import 'package:firebase_database/firebase_database.dart';

const int numberOfCharactersInDB = 998;

List<Character> getAllCharacters() {
  throw UnimplementedError();
}

List<Character> getPagedCharacters() {
  throw UnimplementedError();
}

List<int> getRandomIds(int maxId) {
  var random = Random();
  var n1 = random.nextInt(maxId);
  var n2 = random.nextInt(maxId - 1);
  if (n2 >= n1) n2 += 1;
  return [n1, n2];
}

List<Character> getDummyCharacters() {
  return [
    Character(
        "character-0",
        0,
        "Abomination (Emil Blonsky)",
        "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg",
        10,
        100),
    Character(
        "character-0",
        0,
        "Abomination (Emil Blonsky)",
        "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg",
        10,
        100),
  ];
}

Future<List<Character>> getShowdownCharacters() async {
  final database = FirebaseFirestore.instance;

  var output = <Character>[];

  final randomIds = getRandomIds(numberOfCharactersInDB);

  for (var id in randomIds) {
    var documentId = "character-$id";
    var charRef = database.collection("characters").doc(documentId);

    await charRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        var char = Character(documentId, data["character_id"], data["name"],
            data["picture_url"], data["votes_for"], data["votes_against"]);
        output.add(char);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  return output;
}

void increaseVoteFor(String DocumentID, int votesFor) {
  final database = FirebaseFirestore.instance;
  database
      .collection("characters")
      .doc(DocumentID)
      .update({"votes_for": votesFor}).then(
          (value) => print("Zinkrementowano wartosc votesFor dla $DocumentID"),
          onError: (e) => print("Error updating document $e"));
}

void increaseVoteAgainst(String DocumentID, int votesAgainst) {
  final database = FirebaseFirestore.instance;
  database
      .collection("characters")
      .doc(DocumentID)
      .update({"votes_against": votesAgainst}).then(
          (value) =>
              print("Zinkrementowano wartosc votesAgainst dla $DocumentID"),
          onError: (e) => print("Error updating document $e"));
}

Future<List<Character>> getWholeDataSortedByVotesFor(
    int votes, String name) async {
  var output = <Character>[];
  final database = FirebaseFirestore.instance;
  var wholeData;
  if (name.isEmpty) {
    wholeData = database
        .collection("characters")
        .orderBy("votes_for", descending: true)
        .orderBy("name")
        .limit(10);
  } else {
    wholeData = database
        .collection("characters")
        .orderBy("votes_for", descending: true)
        .orderBy("name")
        .startAfter([votes, name]).limit(10);
  }
  QuerySnapshot query = await wholeData.get();
  final allData = query.docs.map((doc) => doc.data()).toList();
  for (Object? obj in allData) {
    final data = obj as Map<String, dynamic>;
    var char = Character("", data["character_id"], data["name"],
        data["picture_url"], data["votes_for"], data["votes_against"]);
    output.add(char);
  }
  print(allData.length);

  return output;
}
