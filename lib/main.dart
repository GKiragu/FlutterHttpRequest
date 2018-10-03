import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final appTitle = 'Http Request App';

    return MaterialApp(
      title: appTitle,
      home: HomePage(title : appTitle),
    );
  }
}