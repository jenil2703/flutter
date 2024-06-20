import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Alert Dialog"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            ElevatedButton(onPressed: (){
              simplealert(context);
            }, child: Text("Simple alert"))
          ],
        ),
      )
    );
  }

  void simplealert(BuildContext context)
  {
    Widget okButton = ElevatedButton(onPressed: (){
      Navigator.of(context).pop();
    }, child: Text("OK"));

    AlertDialog alert = AlertDialog
      (
      title: Text("Simple Alert Message"),
      content:  Text("This is an alert message...!! Press OK button for exit..!!"),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alert;
        });
  }
}
