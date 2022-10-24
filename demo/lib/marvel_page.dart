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
              "https://i.pinimg.com/originals/23/17/11/231711c17776fbdac6e3cb1b202cada7.jpg",
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
              child: const Text("Kapitan Americorg"),
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
              "https://i.pinimg.com/originals/af/cf/c3/afcfc3f135baf95aaf1ac1daa594b895.jpg",
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
              child: const Text("Thorgi"),
            ),
          ),
        ],
      ),
    );
  }
}
