import 'dart:io';

import 'package:chit_chat/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  print("enter your name");
  String? name = stdin.readLineSync();
  stdout.write(name);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
