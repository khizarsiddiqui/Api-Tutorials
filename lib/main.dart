import 'package:apitutorials/home_screen.dart';
import 'package:apitutorials/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'example_two.dart';
import 'example_three.dart';
import 'example_four.dart';
import 'example_five.dart';
import 'signup.dart';
import 'upload_image.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const UploadImageScreen(),
    );
  }
}

