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

  List<String> name =
  [
    'Jenil',
    'Darshan',
    'Jay'
  ];

  List<String> subtitle =
  [
    'Designation',
    'Designation',
    'Designation',
  ];

  List<String> date =
  [
    '20-02-2024',
    '25-02-2024',
    '27-02-2024'
  ];

  List<String> time =
  [
    '25 days ago',
    '27 days ago',
    '30 days ago'
  ];

  List<String> image =
  [
    'assets/image.png',
    'assets/image.png',
    'assets/image.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView With Card"),backgroundColor: Colors.blueGrey,),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context,index)
          {
            return Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Card(
                  margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
                  color: Colors.red[600],
                  child: ListTile(
                    title: Column(
                      children:
                      [
                        Container
                          (
                            child: Text(name[index],style: TextStyle(fontWeight: FontWeight.bold),),
                            alignment: Alignment.topLeft,
                            ),
                        Container(
                            child: Text(subtitle[index]),
                            alignment: Alignment.topLeft,
                        ),
                      ],
                    ),

                    subtitle: Row(
                      children:
                      [
                        Container(
                          child: Text(date[index])
                        ),
                        Spacer(),
                        Container(
                          child: Text(time[index])
                        ),
                      ],
                    ),


                    trailing: Row(mainAxisSize: MainAxisSize.min,
                      children:
                      [
                        Container
                          (
                            child: CircleAvatar(child: Image.asset(image[index]),backgroundColor: Colors.teal),
                          ),
                        Container(
                          child: Icon(Icons.navigate_next),
                        )
                      ],
                    ),
                  ),
                ),
            );
          }
      ),
    );
  }
}
