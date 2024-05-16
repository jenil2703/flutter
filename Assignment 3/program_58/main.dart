import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double red = 0;
  double green = 0;
  double blue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Color.fromRGBO(red.round(), green.round(), blue.round(), 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Row(
              children:
              [
                Text("Red",style: TextStyle(color: Colors.white),),
                Slider(
                    min: 0,
                    max: 255,
                    divisions: 255,
                    label: "RED: ${red.round()}",
                    value: red,
                    onChanged: (value){
                      setState(() {
                        red = value;
                      });
                    }),
              ],
            ),

            Row(
              children:
              [
                Text("Green",style: TextStyle(color: Colors.white)),
                Slider(
                    min: 0,
                    max: 255,
                    divisions: 255,
                    label: "GREEN: ${green.round()}",
                    value: green,
                    onChanged: (value){
                      setState(() {
                        green = value;
                      });
                    }),
              ],
            ),

            Row(
              children:
              [
                Text("Blue",style: TextStyle(color: Colors.white)),
                Slider(
                    min: 0,
                    max: 255,
                    divisions: 255,
                    label: "BLUE: ${blue.round()}",
                    value: blue,
                    onChanged: (value){
                      setState(() {
                        blue = value;
                      });
                    }),
              ],
            ),

          ],
        ),
      )
    );
  }
}

