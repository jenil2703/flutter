import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Operator {Addition,Substraction,Multiplication,Division}

class _MyAppState extends State<MyApp> {

  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  double result = 0;
  String operation='';

  void Result()
  {
    double number1 = double.tryParse(num1.text) ?? 0;
    double number2 = double.tryParse(num2.text) ?? 0;

    setState(() {
      switch(operation)
      {
        case 'Addition' :
          result = number1 + number2;
          break;

        case 'Substraction' :
          result = number1 - number2;
          break;

        case 'Multiplication' :
          result = number1 * number2;
          break;

        case 'Division' :
          result = number1 / number2;
          break;

        default :
          result = 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Program 52"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(controller: num1,decoration: InputDecoration(label: Text("Enter Number1"),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)),keyboardType: TextInputType.number,),
              SizedBox(height: 20,),

              TextFormField(controller: num2,decoration: InputDecoration(label: Text("Enter Number2"),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)),keyboardType: TextInputType.number,),

              SizedBox(height: 20,),


              RadioListTile(
                  title: Text("Addition"),
                  value: 'Addition',
                  groupValue: operation,
                  onChanged: (value)
                  {
                    setState(() {
                      operation = value!;
                    });
                  }),

              RadioListTile(
                  title: Text("Substraction"),
                  value: 'Substraction',
                  groupValue: operation,
                  onChanged: (value)
                  {
                    setState(() {
                      operation = value!;
                    });
                  }),

              RadioListTile(
                  title: Text("Multiplication"),
                  value: 'Multiplication',
                  groupValue: operation,
                  onChanged: (value)
                  {
                    setState(() {
                      operation = value!;
                    });
                  }),

              RadioListTile(
                  title: Text("Division"),
                  value: 'Division',
                  groupValue: operation,
                  onChanged: (value)
                  {
                    setState(() {
                      operation = value!;
                    });
                  }),

              SizedBox(height: 20,),

              ElevatedButton(onPressed: ()
              {
                Result();
              }, child: Text("OK")),

              SizedBox(height: 20,),

              Text('Result => $result',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)

            ],
          ),
        ),
      ),
    );
  }
}

