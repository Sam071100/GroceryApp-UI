import 'dart:async';

import 'package:flutter/material.dart';

import 'Screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Store',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColorDark: Colors.white30,
        accentColor: Colors.blue,
      ),
      home: MyHomePage(title: 'Groceries Cart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => home_screen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(30.0),
        width: 250.0,
        height: 250.0,
        child: Image.asset('images/jio.jpg'),
      ),
    );
  }
}
