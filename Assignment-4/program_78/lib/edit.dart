import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Edit extends StatefulWidget
{
  late List list;
  late int index;

  Edit({required this.list,required this.index});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit>
{
  TextEditingController _name = TextEditingController();

  @override
  void initState()
  {
    _name = TextEditingController(text: widget.list[widget.index]['name']);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("Index is ${widget.index}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: Center
          (
          child: Column
            (
            children:
            [
              TextFormField
                (
                controller: _name,
                decoration: InputDecoration(
                  label: Text("Enter name",style: TextStyle(fontSize: 24)),
                  border: OutlineInputBorder(),
                ),
              ),
        
              SizedBox(height: 10,),
        
              MaterialButton(
                  color: Colors.purple.shade100,
                  onPressed: (){
                _updatedata();
                Navigator.push(context,MaterialPageRoute(builder: (context) => Myapp()));
              }, child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updatedata()
  {
    var url = Uri.parse("https://jenil2703.000webhostapp.com/API78/update.php");
    http.post(url,body:
    {
      "id":widget.list[widget.index]['id'],
      "name":_name.text.toString(),
    });
  }
}