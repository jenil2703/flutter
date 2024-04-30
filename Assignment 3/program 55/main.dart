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

  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox Example"),backgroundColor: Colors.blueGrey,),

      body: Center(
        child: Column(
          children:
          [
            CheckboxListTile(
                title: Text("Show TextView",style: TextStyle(fontSize: 20),),
                value: showText,
                onChanged: (value){
                  setState(() {
                    showText = value!;
                  });
                }),

                SizedBox(height: 100,),

                if(showText==true)
                  Column
                    (
                      children:
                      [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Image.asset("assets/india.png",height: 175,width: 175,),
                            SizedBox(width: 15,),
                            Image.asset("assets/china.png",height: 175,width: 175,)
                          ],
                        ),

                        SizedBox(height: 15,),

                        Text('Hello World!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blueGrey),),

                        SizedBox(height: 15,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Image.asset("assets/austria.png",height: 175,width: 175,),
                            SizedBox(width: 15,),
                            Image.asset("assets/france.png",height: 175,width: 175,)
                          ],
                        ),
                      ],
                    ),
          ],
        ),
      ),
    );
  }
}

