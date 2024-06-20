import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_crud/main.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>
{
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();

  void _insertdata()
  {
    var url = Uri.parse("https://jenil2703.000webhostapp.com/crudAPI/insert.php");
    http.post(url,body:
    {
      "fname":fname.text.toString(),
      "lname":lname.text.toString(),
      "email":email.text.toString()

    });

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Json Crud App"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            TextFormField(controller: fname,decoration: InputDecoration(hintText: "Enter Your Firstname",border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            TextFormField(controller: lname,decoration: InputDecoration(hintText: "Enter Your Lastname",border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            TextFormField(controller: email,decoration: InputDecoration(hintText: "Enter Your Email",border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              _insertdata();
              print("Inserted");
              Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));



            }, child: Text("Insert"))
          ],
        ),
      ),



    );
  }
}