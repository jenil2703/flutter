import 'package:flutter/material.dart';
import 'database.dart';
import 'main.dart';

class AddPage extends StatefulWidget
{
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>
{
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  MyDb db = MyDb();

  @override
  void initState()
  {
    // TODO: implement initState
    // super.initState();

    db.open();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Add Data"),backgroundColor: Colors.blueGrey,),
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            TextField(controller: fname,decoration: InputDecoration(hintText: "Enter Your Firstname",border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            TextField(controller: lname,decoration: InputDecoration(hintText: "Enter Your Lastname",border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            TextField(controller: email,decoration: InputDecoration(hintText: "Enter Your Email",border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              db.db.rawInsert("insert into students(fname,lname,email) values(?,?,?)",[fname.text.toString(),lname.text.toString(),email.text.toString()]);
              print("Inseretd");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
            }, child: Text("Add"))
          ],
        ),
      ),
    );
  }
}