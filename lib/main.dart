import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/destinations_screen.dart';

import './screens/home_screen.dart';
import './screens/crew_screen.dart';
import './screens/technology_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, dynamic> data = {};

  Future<void> _readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');

    final responseData = await json.decode(response);
    setState(() {
      data = responseData;
    });
  }

  @override
  void initState() {
    _readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space Travel App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: ThemeData().appBarTheme.copyWith(
                color: Colors.transparent,
                elevation: 0,
              )),
      home: const HomeScreen(),
      routes: {
        DestinationsScreen.routeName: (_) => DestinationsScreen(data: data),
        CrewScreen.routeName: (_) => CrewScreen(data: data),
        TechnologyScreen.routeName: (_) => TechnologyScreen(data: data),
      },
    );
  }
}
