import 'package:flutter/material.dart';
import 'package:json_crud/main.dart';
import 'package:http/http.dart' as http;


class edit extends StatefulWidget {
  //const edit({super.key});

  late List list;
  late int index;

  edit({required this.list,required this.index});


  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();

    fname = TextEditingController(text: widget.list[widget.index]['fname']);
    lname = TextEditingController(text: widget.list[widget.index]['lname']);
    email = TextEditingController(text: widget.list[widget.index]['email']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update details"),backgroundColor: Colors.blueGrey,),
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
              updatedata();
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }

  void updatedata()
  {
    var url = "https://jenil2703.000webhostapp.com/crudAPI/update.php";
    http.post(Uri.parse(url),body:
    {
      'id':widget.list[widget.index]['id'],
      'fname':fname.text.toString(),
      'lname':lname.text.toString(),
      'email':email.text.toString(),


    });

  }
}
