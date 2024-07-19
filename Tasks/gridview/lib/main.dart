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

  List<String> flagname =
  [
    'India',
    'Austria',
    'Canada',
    'Bhutan',
    'China',
    'France',
    'Germany',
    'Iran',
    'Italy',
    'Russia',
    'Sri Lanka',
    'USA'
  ];
  
  List<String> flag = 
  [
    'assets/india.png',
    'assets/austria.png',
    'assets/canada.png',
    'assets/bhutan.png',
    'assets/china.png',
    'assets/france.png',
    'assets/germany.png',
    'assets/iran.png',
    'assets/italy.png',
    'assets/russia.png',
    'assets/srilanka.png',
    'assets/USA.png',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: GridView.builder(
            itemCount: flagname.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0
              ),
            itemBuilder: (context,index)
          {
            return GridTile(
            child: Column(
            children:
            [
              Image.asset(flag[index],height: 175,width: 175),
              Text(flagname[index]),
            ],
            ));
          }
        ),
    ),
    );
  }
}

