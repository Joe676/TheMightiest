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
        prototypeItem: ListTile(
          title: Text("Abomination"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(characters[index].name.toString()),
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20)),
              leading: CircleAvatar(
                  backgroundImage:
                      Image.network(characters[index].imgUrl).image,
                  child: Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        ((index + 1).toString()),
                        style: TextStyle(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.black,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )));
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
