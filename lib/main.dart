import 'package:flutter/material.dart';
import 'package:flutter_apps/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DetailScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}