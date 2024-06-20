import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: myapp(),debugShowCheckedModeBanner: false,));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date picker app"),backgroundColor: Colors.blueGrey,),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              TextFormField(
                controller: _date,
                style: TextStyle(fontWeight: FontWeight.bold),
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select a date",
                  prefixIcon: IconButton(
                    onPressed: (){
                      showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100)).then((value) => _date.text = value.toString()
                      );
                    }, icon: Icon(Icons.calendar_month_sharp),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
