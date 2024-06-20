import 'package:flutter/material.dart';
import 'package:program_78/main.dart';
import 'package:http/http.dart' as http;


class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Page',style: TextStyle(fontWeight: FontWeight.bold))),

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              TextFormField
                (
                  cursorColor: Colors.white,
                  controller: _name,
                  decoration: InputDecoration(
                    label: Text("Enter name",style: TextStyle(fontSize: 24)),
                    border: OutlineInputBorder(),
                    hintText: "Enter name"
                  ),
                ),

              SizedBox(height: 20,),

              MaterialButton(
                  color: Colors.purple.shade100,
                  onPressed: (){
                    _insert();
                    print("Inserted !!");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Myapp()));
              },child: Text("INSERT",style: TextStyle(fontSize: 24),),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _insert()
  {
    var url = Uri.parse("https://jenil2703.000webhostapp.com/API78/insert.php");
    http.post(url,body:
    {
      "name":_name.text.toString(),
    });
  }
}
