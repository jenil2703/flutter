import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginform/secondscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  late SharedPreferences sharedPreferences;
  late bool newuser;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 5),() =>

        checklogin()
//        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>MyLoginPage()))
    );
  }

  void checklogin()async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('mylogin') ?? true);
    print(newuser);

    if(newuser==true)
      {
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => MyLoginPage()));
      }

    if(newuser==false)
    {
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => dashboard()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/anim.json'),
      ),
    );
  }
}
