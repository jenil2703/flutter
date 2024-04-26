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

  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
   List<int> numbers = [];

  void integer() {
    numbers.clear();
    int firstNumber = int.parse(num1.text);
    int secondNumber = int.parse(num2.text);
    for (int i = firstNumber + 1; i < secondNumber; i++) {
      numbers.add(i);
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('program 51'),backgroundColor: Colors.blueGrey,),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(controller: num1,decoration: InputDecoration(label: Text('Enter number 1'),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)),),

            SizedBox(height: 20,),

            TextFormField(controller: num2,decoration: InputDecoration(label: Text('Enter number 2'),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)),),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              setState(() {
                integer();
                }
              );
            }, child: Text('OK')),

            SizedBox(height: 20),

            Text('OUTPUT : ${numbers.toString()}')

          ],
        ),
      ),
    );
  }
}
