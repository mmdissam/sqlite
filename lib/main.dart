import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'SQLite',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
