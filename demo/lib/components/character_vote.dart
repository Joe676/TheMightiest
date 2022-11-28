import 'package:demo/marvel_page.dart';
import 'package:demo/models/Character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterVote extends StatefulWidget {
  final Character character;
  final void Function(int) onTap;
  final int ID;
  const CharacterVote(
      {super.key,
      required this.character,
      required this.onTap,
      required this.ID});
  @override
  State<CharacterVote> createState() => _CharacterVoteState();
}

class _CharacterVoteState extends State<CharacterVote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage:
                Image.network(widget.character.imgUrl.toString()).image,
            radius: 170,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              //widget.character.votesFor += 1;
              print(widget.character.name.toString());
              print(widget.character.documentId.toString());
              widget.onTap(widget.ID);
            },
            child: Text(widget.character.name),
          ),
        ),
      ],
    );
  }
}
