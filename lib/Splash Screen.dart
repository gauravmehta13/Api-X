import 'dart:async';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/Homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/splash.gif'), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 280,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: new AlwaysStoppedAnimation<Color>(
              Color(0xFFFF0000),
            ),
          ),
        ],
      ),
    ));
  }
}
