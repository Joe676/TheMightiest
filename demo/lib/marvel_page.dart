import 'package:demo/components/character_vote.dart';
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
    void onTapButton(int ID) {
      if (ID == 0) {
        characters.first.getVoteFor();
        characters[1].getVoteAgainst();
      } else if (ID == 1) {
        characters.first.getVoteAgainst();
        characters[1].getVoteFor();
      }
      refresh();
    }

    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Who will win this Showdown?",
            style: TextStyle(
                fontSize: 60, color: Color.fromARGB(255, 233, 233, 233)),
          ),
          const SizedBox(
            height: 10,
          ),
          CharacterVote(character: characters.first, onTap: onTapButton, ID: 0),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 233, 233, 233),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CharacterVote(character: characters[1], onTap: onTapButton, ID: 1),
          const SizedBox(
            height: 100,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: refresh,
                  child: const Text(
                    "Draw new pair",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 236, 152, 152),
                    ),
                  ))),
        ],
      ),
    );
  }

  void refresh() async {
    var newChars = await getShowdownCharacters();
    setState(() {
      characters = newChars;
    });
  }
}
