import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqfliteex/database.dart';
import 'package:sqfliteex/main.dart';

class Edit extends StatefulWidget {
  //const Edit({super.key});
  String email;
  Edit ({required this.email});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();

  MyDb db = MyDb();
  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    db.open();
    
    Future.delayed(Duration(milliseconds: 500),()async
    {
      var data = await  db.getstudent(widget.email);

      if(data!=null)
        {
          fname.text = data["fname"];
          lname.text = data["lname"].toString();
          email.text = data["email"];
          setState(() {});
        }
      else
        {
          print("No any data with email : " + widget.email.toString());
        }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email is ${widget.email}"),backgroundColor: Colors.blueGrey,),

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
              db.db.rawUpdate("update students set fname=?,lname=?,email=? where email=?",[fname.text.toString(),lname.text.toString(),email.text.toString()]);
              print("Updated");
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
