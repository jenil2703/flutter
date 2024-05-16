import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
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
      appBar: AppBar(title: Text("Toast Message"),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            MaterialButton(
              shape: OutlineInputBorder(),
              color: Colors.blue,
              onPressed: (){
              Fluttertoast.showToast(msg: "Positive button pressed !!");
            },child: Text("Positive"),),

            SizedBox(width: 5,),

            MaterialButton(
              shape: OutlineInputBorder(),
              color: Colors.blue,
              onPressed: (){
              Fluttertoast.showToast(msg: "Neutral button pressed !!");
            },child: Text("Neutral"),),

            SizedBox(width: 5,),

            MaterialButton(
              shape: OutlineInputBorder(),
              color: Colors.blue,
              onPressed: (){
              Fluttertoast.showToast(msg: "Negative button pressed !!");
            },child: Text("Negative"),),

          ],
        ),
      ),
    );
  }
}
