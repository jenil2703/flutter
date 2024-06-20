import 'package:flutter/material.dart';
import 'package:program_69/second.dart';

void main() {
  runApp(MaterialApp(home: myapp(),debugShowCheckedModeBanner: false,));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  List<String> name =
  [
    "Jenil Dobariya",
    "Jay Patel",
    "Amazon",
    "Google Security",
    "Microsoft account team"
  ];

  List<String> subject =
  [
    "Resume",
    "Assignment upload",
    "Amazon seller notification",
    "Security alert",
    "Microsoft account security code"
  ];

  List<String> date =
  [
    "10 March",
    "12 March",
    "15 March",
    "20 March",
    "27 March",
  ];

  List<String> img =
  [
    "assets/profile.png",
    "assets/profile.png",
    "assets/profile.png",
    "assets/profile.png",
    "assets/profile.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email"),backgroundColor: Colors.blueGrey,),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context,index){
              return Card
                (
                child: ListTile
                  (
                  leading: Image.asset(img[index]),
                  title: Text(name[index],style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(subject[index]),
                  trailing: Container(
                    child: Column(
                      children:
                      [
                        Text(date[index]),
                        SizedBox(height: 5,),
                        Icon(Icons.star_border_purple500_sharp),
                      ],
                    ),
                  ),

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => secondscreen(index: index)));
                  },
                ),
              );
            }),
      ),
    );
  }
}


