import 'package:demo/models/Character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterVote extends StatefulWidget {
  final Character character;
  const CharacterVote({super.key, required this.character});

  @override
  State<CharacterVote> createState() => _CharacterVoteState();
}

class _CharacterVoteState extends State<CharacterVote> {
  // Character character = Character(
  //     "character-0",
  //     0,
  //     "Abomination (Emil Blonsky)",
  //     "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg",
  //     10,
  //     100);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.network(
            widget.character.imgUrl,
            width: 200,
            height: 300,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              widget.character.votesFor += 1;
              print(widget.character);
            },
            child: Text(widget.character.name),
          ),
        ),
      ],
    );
  }
}
