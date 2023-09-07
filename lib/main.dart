import 'package:apitutorials/home_screen.dart';
import 'package:flutter/material.dart';

import 'example_two.dart';
import 'example_three.dart';
import 'example_four.dart';
import 'example_five.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleFive(),
    );
  }
}

