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

  var defaultFont = 12.0;
  final minimum = 8.0;
  final maximum = 34.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FontSize"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("JENIL",style: TextStyle(fontSize: defaultFont),),
            SizedBox(height:10 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                IconButton(onPressed: (){
                  setState(() {
                    if(defaultFont > minimum){
                      defaultFont -= 2;
                    }
                  });
                }, icon: Icon(Icons.remove_circle),iconSize: 50,),

                SizedBox(width: 10,),

                IconButton(onPressed: (){
                  setState(() {
                    if(defaultFont < maximum){
                      defaultFont += 2;
                    }
                  });
                }, icon: Icon(Icons.add_circle),iconSize: 50,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

