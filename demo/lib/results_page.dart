import 'package:demo/dataAccess/CharactersDataAccess.dart';
import 'package:demo/main.dart';
import 'package:demo/models/Character.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});
  @override
  State<StatefulWidget> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  List<Character> characters = [];
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: characters.length,
        itemExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              "${index + 1}. ${characters[index].name}",
              style: const TextStyle(
                  fontSize: 50, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            subtitle: Text(
              "Number of votes: ${characters[index].votesFor}",
              style: const TextStyle(color: Color.fromARGB(255, 240, 202, 163)),
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(20),
            ),
            minLeadingWidth: 60,
            leading: CircleAvatar(
              backgroundImage: Image.network(characters[index].imgUrl).image,
              radius: 40,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          getData();
        },
        label: const Text("Show another 10"),
        icon: const Icon(Icons.add_box_outlined),
        backgroundColor: const Color.fromARGB(78, 255, 0, 0),
      ),
    );
  }

  void getData() async {
    List<Character> data;
    if (characters.isEmpty) {
      data = await getWholeDataSortedByVotesFor(0, "");
    } else {
      data = await getWholeDataSortedByVotesFor(
          characters.last.votesFor, characters.last.name);
    }
    print(data.length);
    print(data.first.name.toString());
    setState(() {
      characters += data;
    });
  }
}
