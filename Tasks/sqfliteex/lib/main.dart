import 'package:flutter/material.dart';
import 'package:sqfliteex/add.dart';
import 'package:sqfliteex/database.dart';
import 'package:sqfliteex/edit.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  MyDb db = MyDb();
  List<Map> slist = [];

  void getdata()
  {
    Future.delayed(Duration(milliseconds: 500),()async
    {
      slist = await db.db.rawQuery('select * from students');
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    getdata();
    db.open();

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Sqflite Example"),backgroundColor: Colors.blueGrey,),
      body: SingleChildScrollView(
        child: Column(
          children:slist.map((stuone)
          {
            return Card
            (
              child: ListTile
                      (
                        leading: Icon(Icons.person),
                        title: Row
                          (
                            children:
                            [
                              Text(stuone["fname"].toString()),
                              SizedBox(width: 5,),
                              Text(stuone["lname"])
                            ],
                          ),
                        subtitle: Text(stuone["email"]),
                        trailing: Wrap
                                    (
                                      children:
                                            [
                                              IconButton(onPressed: ()
                                              {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(email: stuone["email"])));
                                              }, icon: Icon(Icons.edit)),

                                              IconButton(onPressed: ()
                                                  {
                                                    db.db.rawDelete("delete from students where email=?",[stuone["email"]]);
                                                    print("Deleted");
                                                    getdata();
                                                  }, icon: Icon(Icons.delete)),

                                            ],
                                    ),
                      ),
            );
          }).toList()
      )),

      floatingActionButton: FloatingActionButton
        (
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.greenAccent,
        onPressed: ()
        {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

}