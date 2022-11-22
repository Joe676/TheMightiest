import 'package:demo/character_vote.dart';
import 'package:demo/dataAccess/CharactersDataAccess.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'models/Character.dart';

class MarvelPage extends StatefulWidget {
  const MarvelPage({super.key});

  @override
  State<MarvelPage> createState() => _MarvelPageState();
}

class _MarvelPageState extends State<MarvelPage> {
  List<Character> characters = getDummyCharacters();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var newChars = await getShowdownCharacters();
      setState(() {
        characters = newChars;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marvel"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.home_filled),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CharacterVote(character: characters.first),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CharacterVote(character: characters[1]),
        ],
      ),
    );
  }
}
