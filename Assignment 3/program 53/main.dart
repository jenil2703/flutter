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

  Color backgroundcolor = Colors.white;

  void backgroundcolorChange(){
    setState(() {
      backgroundcolor = Colors.black87;
    });
  }

  void reversecolorChange(){
    setState(() {
      backgroundcolor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change BG "),backgroundColor: Colors.blueGrey,),
      body: Container(
        color: backgroundcolor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              ElevatedButton(onPressed: backgroundcolorChange, child: Text('Change BG Color')),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: reversecolorChange, child: Text("Reverse BG color"))
            ],
          ),
        ),
      ),
    );

  }
}
