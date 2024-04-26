import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController number = TextEditingController();
  String _reversedNumber = '';

  void _reverseNumber() {
    String input = number.text;
    if (input.isNotEmpty) {
      int? number = int.tryParse(input);
      if (number != null) {
        String reversed = number.toString().split('').reversed.join();
        setState(() {
          _reversedNumber = reversed;
        });
      } else {
        setState(() {
          _reversedNumber = 'Invalid input';
        });
      }
    } else {
      setState(() {
        _reversedNumber = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reverse Number App"),backgroundColor: Colors.blueGrey),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: number,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter a number',border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: _reverseNumber,
              child: Text('Reverse'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Reversed Number: $_reversedNumber',
              style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}



