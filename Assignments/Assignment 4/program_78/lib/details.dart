import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'edit.dart';
import 'main.dart';
class Details extends StatefulWidget
{
  late List list;
  late int index;

  Details({required this.list,required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text('Update',style: TextStyle(fontWeight: FontWeight.bold))),
        body: Center
        (
        child: Column
          (
         children:
          [
            Text(
              widget.list[widget.index]['name'],
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
            ),

            MaterialButton(
              color: Colors.purple.shade50,
              onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Edit(list:widget.list,index:widget.index)));
              },child: Text("Edit"),
            ),

            MaterialButton(
                child: Text("Delete"),
                color: Colors.purple.shade50,
                onPressed: ()
                {
                  _deleteAlert();
                }
            )
          ],
        ),
      ),
    );
  }

  void confirm()
  {
    var url = "https://jenil2703.000webhostapp.com/API78/delete.php";
    http.post(Uri.parse(url),body:
    {
      'id':widget.list[widget.index]['id'],
    });
    Navigator.of(context).push
      (MaterialPageRoute(builder: (BuildContext context)=> Myapp()));
  }

  void _deleteAlert()
  {
    showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        backgroundColor: Colors.purple.shade50,
        title: Text("DELETE ALERT!!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        content: Text("Are you sure you want to delete?"),
        actions:
        [
          MaterialButton(
              color: Colors.purple.shade100,
              onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("CANCLE")),

          MaterialButton(
              color: Colors.purple.shade100,
              onPressed: () {
                setState(() {
                  confirm();
                });
              }, child: Text("OK")),
        ],
      );
    });
  }
}