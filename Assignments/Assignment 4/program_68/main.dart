import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//statefull
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> items =
  [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Context Menu",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30)),
        backgroundColor: Colors.black,),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              return Card(
                color: Colors.purple.shade50,
                child: ListTile
                  (
                    title: Text(items[index]),
                    onTap: (){
                      _showMenu(context,index);
                    },
                  ),
              );
            }),
      )
    );
  }

  void _showMenu(context,index)
  {
    showModalBottomSheet(
      backgroundColor: Colors.purple.shade50,
        context: context,
        builder: (BuildContext context){
          return Container(
            child: Wrap(
              children:
              [
                ListTile(
                  leading: Icon(Icons.remove_red_eye),
                  title: Text("View"),
                  onTap: (){
                    Navigator.of(context).pop();
                    _view(index);

                  },
                ),

                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("Edit"),
                  onTap: (){
                    Navigator.of(context).pop();
                    _edit(index);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Delete"),
                  onTap: (){
                    Navigator.of(context).pop();
                    _delete(index);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _view(index)
  {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.purple.shade50,
        title: Text("View Item",style: TextStyle(fontWeight: FontWeight.bold),),
        content: Text("You are viewing ${items[index]}"),
        actions:
        [
          MaterialButton(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.black,
              onPressed: (){
                Navigator.of(context).pop();
          },child: Text("CLOSE",style: TextStyle(color: Colors.white),),
          )
        ],
      );
    });
  }

  void _edit(index)
  {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.purple.shade50,
        title: Text("View Item",style: TextStyle(fontWeight: FontWeight.bold),),
        content: Text("You are editing ${items[index]}"),
        actions:
        [
          MaterialButton(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.black,
            onPressed: (){
              Navigator.of(context).pop();
            },child: Text("CLOSE",style: TextStyle(color: Colors.white),),
          )
        ],
      );
    });
  }

  void _delete(index)
  {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.purple.shade50,
        title: Text("View Item",style: TextStyle(fontWeight: FontWeight.bold),),
        content: Text("You are deleting ${items[index]}"),
        actions:
        [
          MaterialButton(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.black,
            onPressed: (){
              setState(() {
                items.removeAt(index);
                Navigator.of(context).pop();
              });
            },child: Text("DELETE",style: TextStyle(color: Colors.white),),
          )
        ],
      );
    });
  }
}

