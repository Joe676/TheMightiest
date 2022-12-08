import 'package:demo/main.dart';
import 'package:demo/models/Character.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

Widget pop_up_hero(BuildContext context, Character hero) {
  return AlertDialog(
    title: Text(
      hero.name.toString().toUpperCase(),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Hero(
            tag: "pic",
            child: Image.network(
              hero.imgUrl,
              height: 400,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "Votes for: ${hero.votesFor}",
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(158, 41, 124, 13),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              "Votes Against: ${hero.votesAgainst}",
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(223, 240, 94, 94),
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Color.fromARGB(255, 19, 8, 8))),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Go Back'),
      ),
    ],
  );
}
