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

  Color _defaultColor = Colors.white;

  void _onColorSeleted(Color color)
  {
    setState(() {
      _defaultColor = color;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change BG color using RadioButton")),

      body:Container(
        color: _defaultColor,
        child: Column(
          children:
          [
            SizedBox(height: 30,),
            Text("Change BG Color Using RadioButton",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            SizedBox(height: 100,),

            RadioListTile(
                title: Text("Red"),
                value: Colors.red,
                groupValue: _defaultColor,
                onChanged: (value){
                  setState(() {
                    _onColorSeleted(Colors.red);
                  });
                }),

            RadioListTile(
                title: Text("Green"),
                value: Colors.green,
                groupValue: _defaultColor,
                onChanged: (value){
                  setState(() {
                    _onColorSeleted(Colors.green);
                  });
                }),

            RadioListTile(
                title: Text("Blue"),
                value: Colors.blue,
                groupValue: _defaultColor,
                onChanged: (value){
                  setState(() {
                    _onColorSeleted(Colors.blue);
                  });
                }),
          ],
        ),
      ),
    );
  }
}


