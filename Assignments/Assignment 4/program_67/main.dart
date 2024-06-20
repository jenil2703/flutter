import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: myapp(),debugShowCheckedModeBanner: false,));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  List<String> list = ["Profile","Logout"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions:
        [
          PopupMenuButton(itemBuilder: (BuildContext context){
            return list.map((String choice) {
              return PopupMenuItem(
                  value: choice,
                  child: Text(choice));
            }).toList();
          })
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(" Profile and Logout option in options menu",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)
          ],
        ),
      ),
    );
  }
}
