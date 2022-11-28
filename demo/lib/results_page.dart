import 'package:demo/dataAccess/CharactersDataAccess.dart';
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
              style: const TextStyle(fontSize: 50),
            ),
            subtitle: Text("Number of votes: ${characters[index].votesFor}"),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(20),
            ),
            //minLeadingWidth: 100,
            leading: CircleAvatar(
              backgroundImage: Image.network(characters[index].imgUrl).image,
              radius: 50,
            ),
          );
        },
      ),
    );
  }

  void getData() async {
    final data = await getWholeDataSortedByVotesFor();
    print(data.length);
    print(data.first.name.toString());
    setState(() {
      characters = data;
    });
  }
}
