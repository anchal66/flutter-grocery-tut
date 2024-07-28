import 'package:bloc_tet/features/home/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: Home(),
    );
  }
}
//What is bloc:
// UI pass event -> BLOC ->
//Bloc takes event do some logic and pass -> STATE
// This state then updates the UI