import 'package:flutter/material.dart';
import 'package:program_74/screen2.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Main Screen.!!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            SizedBox(height: 25,),

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
            },child: Text("Go to next Page"),
            ),
          ],
        ),
      ),
    );
  }
}

