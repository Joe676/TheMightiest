import 'package:demo/marvel_page.dart';
import 'package:flutter/src/widgets/container.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const MarvelPage();
              },
            ),
          );
        },
        child: const Text("Przejdz do glosowania"),
      ),
    );
  }
}
