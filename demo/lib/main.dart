import 'dart:convert';

import 'package:demo/home_page.dart';
import 'package:demo/profile_page.dart';
import 'package:demo/results_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(0, 0, 92, .1),
  100: const Color.fromRGBO(0, 0, 92, .2),
  200: const Color.fromRGBO(0, 0, 92, .3),
  300: const Color.fromRGBO(0, 0, 92, .4),
  400: const Color.fromRGBO(0, 0, 92, .5),
  500: const Color.fromRGBO(0, 0, 92, .6),
  600: const Color.fromRGBO(0, 0, 92, .7),
  700: const Color.fromRGBO(0, 0, 92, .8),
  800: const Color.fromRGBO(0, 0, 92, .9),
  900: const Color.fromRGBO(0, 0, 92, 1),
};
MaterialColor colorCustom = MaterialColor(0x00005C, color);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); //uruchom aplikacje myapp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 12, 73),
        primarySwatch: colorCustom,
      ),
      home: const Rootpage(),
    );
  }
}

class Rootpage extends StatefulWidget {
  const Rootpage({super.key});

  @override
  State<Rootpage> createState() => _RootpageState();
}

class _RootpageState extends State<Rootpage> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    ResultsPage(),
    ProfilePage(),
  ];
  int ctr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        shadowColor: const Color.fromARGB(78, 255, 0, 0),
        leading: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Marvel-Comics-Logo.svg/1280px-Marvel-Comics-Logo.svg.png"),
        title: const Text(
          "The Mightest",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.sports_martial_arts), label: "Showdown"),
          NavigationDestination(icon: Icon(Icons.table_rows), label: "Results"),
          // NavigationDestination(
          //     icon: Icon(Icons.person_sharp), label: "Profile"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            //setstate odswieza ekran
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
