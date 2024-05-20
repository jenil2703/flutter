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

  String _selectedCity = "Selected city";

  void _showSelectionDialog (BuildContext context)
  {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog
        (
          title: Text("Select a city"),
          content: SingleChildScrollView(
            child: ListBody(
              children:
              [
                _cityItems("Rajkot"),
                _cityItems("Ahmedabad"),
                _cityItems("Gandhinagar"),
                _cityItems("Vadodara"),
                _cityItems("Surat"),
              ],
            ),
          ),
        );
    },
    ).then((value) {
      if(value != null)
        {
          setState(() {
            _selectedCity = value;
          });
        }
    });
  }

  _cityItems(String city)
  {
    return ListTile(
      title: Text(city),
      onTap: (){
        Navigator.of(context).pop(city);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("City Selection"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            MaterialButton(
              color: Colors.blueGrey,
              onPressed: (){
                _showSelectionDialog(context);
              },child: Text("SELECT CITY"),
            ),
            SizedBox(height: 30,),

            Text("Selected City :",style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 10,),

            Text(_selectedCity,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
