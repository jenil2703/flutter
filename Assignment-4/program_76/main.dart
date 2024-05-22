import 'package:flutter/material.dart';
import 'package:program_76/sumResult.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.lightBlue),
    home: myapp(),debugShowCheckedModeBanner: false,));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();

  double _sum = 0;

  void _result()
  {
    setState(() {
      double number1 = double.tryParse(_num1.text) ?? 0;
      double number2 = double.tryParse(_num2.text) ?? 0;
      _sum = number1 + number2;
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => SumResultScreen(result: _sum)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sum App")),

      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children:
             [
               TextFormField(
                 controller: _num1,
                 decoration: InputDecoration(hintText: "Enter number 1",border: OutlineInputBorder()),
                 keyboardType: TextInputType.number,
               ),

               SizedBox(height: 20,),

               TextFormField(
                 controller: _num2,
                 decoration: InputDecoration(hintText: "Enter number 2",border: OutlineInputBorder()),
                 keyboardType: TextInputType.number,
               ),

               SizedBox(height: 20,),

               MaterialButton(
                 color: Colors.blue.shade200,
                 onPressed: (){
                   _result();
               },child: Text('Sum'),
               ),

             ],
          ),
        ),
      ),
    );
  }
}

