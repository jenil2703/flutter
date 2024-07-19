import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    checkconnection();
  }

  void checkconnection() async
  {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile)
      {
        Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp())));
      }
    else if(connectivityResult == ConnectivityResult.wifi)
      {
        Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp())));
      }
    else
      {
        _showConnectionDialog();
      }
  }

  void _showConnectionDialog()async
  {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.grey,
            title: Row(children: [Icon(Icons.error),Text("\t Network Error")],),
            content: Text("Please check your internet connection.",style: TextStyle(fontStyle: FontStyle.italic),),
            actions:
            [
              ElevatedButton(onPressed: ()
              {
                exit(0);
              }, child: Text("Exit",style: TextStyle(color: Colors.grey),))
            ],
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash Screen"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Column(
          children: [
            Lottie.asset("assets/anim.json")
          ],
        ),
      ),
    );
  }
}
