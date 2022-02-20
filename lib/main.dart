import 'package:flutter/material.dart';
import 'package:joke_jokkis/ui_wigets/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke Jokkis',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
