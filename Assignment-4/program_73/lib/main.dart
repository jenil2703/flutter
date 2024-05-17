import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'dashboard.dart';

void main() {
  runApp(MaterialApp(home: splashscreen(),debugShowCheckedModeBanner: false,));
}

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 5), () =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Lottie.asset("assets/anim1.json",height: 500,width: 500)
          ],
        ),
      ),
    );
  }
}

