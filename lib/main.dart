import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: MyHomePage1()));
  }
}

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('myimages/rcs_splash.jpg'), fit: BoxFit.cover)),
      // color: Colors.white,
      // child:FlutterLogo(size:MediaQuery.of(context).size.height
    );
  }
}
