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
        primarySwatch: Colors.deepOrange,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          debugPrint("nacisnieto guziczek");
          final ref = FirebaseDatabase.instance.ref();
          final snapshot = await ref.child('users/123').get();
          if (snapshot.exists) {
            debugPrint(snapshot.value.toString());
            debugPrint(snapshot.value.toString().substring(6, 8));
            ctr = int.parse(snapshot.value.toString().substring(6, 8));
          } else {
            debugPrint('No data available.');
          }

          DatabaseReference refSend =
              FirebaseDatabase.instance.ref("users/123");
          await refSend.set({
            "name": "John",
            "age": ctr + 1,
          });
        },
        child: const Icon(Icons.heart_broken),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.table_rows), label: "Results"),
          NavigationDestination(
              icon: Icon(Icons.person_sharp), label: "Profile"),
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
