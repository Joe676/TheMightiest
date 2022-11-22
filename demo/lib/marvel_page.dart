import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MarvelPage extends StatefulWidget {
  const MarvelPage({super.key});

  @override
  State<MarvelPage> createState() => _MarvelPageState();
}

class _MarvelPageState extends State<MarvelPage> {
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
          Center(
            child: Image.network(
              "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg",
              width: 200,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Abomination (Emil Blonsky)"),
            ),
          ),
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
          Center(
            child: Image.network(
              "http://i.annihil.us/u/prod/marvel/i/mg/5/50/4c003442a3ea6.jpg",
              width: 200,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Johnny Blaze"),
            ),
          ),
        ],
      ),
    );
  }
}
