import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child: Scaffold(appBar: AppBar(title: Text("Exit Dialog"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Text("Press back button to exit")
            ],
          ),
        ),
        ),

        onWillPop: () async {
          bool exit = await _exitDialog(context);
          return exit;
        });
  }

  _exitDialog(BuildContext context)
  {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog
        (
          title: Text("Confirm Exit..!!",style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text("Are you sure you want to exit?"),
          actions: <Widget>
          [
            MaterialButton(onPressed: (){
              Navigator.of(context).pop(false);
            },child: Text("CANCLE"),
            ),

            MaterialButton(onPressed: (){
              Navigator.of(context).pop(true);
            },child: Text("OK"),
            ),
          ],
        );
    });
  }
}
