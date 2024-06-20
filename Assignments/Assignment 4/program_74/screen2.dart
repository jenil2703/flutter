import 'package:flutter/material.dart';
import 'package:program_74/main.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Second Screen.!!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            SizedBox(height: 25,),

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            },child: Text("Go to previous Page"),
            ),
          ],
        ),
      ),
    );
  }
}
