import 'dart:convert';

import 'package:demo/home_page.dart';
import 'package:demo/profile_page.dart';
import 'package:demo/results_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

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
        scaffoldBackgroundColor: Color.fromARGB(255, 209, 202, 202),
        primarySwatch: Colors.blueGrey,
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
        title: const Text("demo"),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.sports_martial_arts), label: "Showdown"),
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
