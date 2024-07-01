import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/history.dart';

import 'db.dart';

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

  final dbHelper = DbHelper.instance;


  void Result() async
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

    String entry = '$number1 $operation $number2 = $result';
    int id = await dbHelper.insert(entry);
    print('Inserted entry with ID: $id');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("T A S K",style: TextStyle(fontSize: 30),),
      actions:
      [
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('History'),
              value: 'history',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen()));
              },
            ),
          ],
        ),
      ],),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: num1,
                  decoration: InputDecoration(
                      label: Text("Enter Number1"),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)
                  ),
                  keyboardType: TextInputType.number
                ),
                SizedBox(height: 20,),

                TextFormField(
                  controller: num2,
                  decoration: InputDecoration(
                      label: Text("Enter Number2"),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)
                  ),
                  keyboardType: TextInputType.number,),

                SizedBox(height: 20,),


                RadioListTile(
                    contentPadding: EdgeInsets.only(left: 0),
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
                    contentPadding: EdgeInsets.only(left: 0),
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
                    contentPadding: EdgeInsets.only(left: 0),
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
                    contentPadding: EdgeInsets.only(left: 0),
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

                // ElevatedButton(onPressed: ()
                // {
                //   Result();
                // }, child: Text("Calculate")),

                MaterialButton(
                  minWidth: double.infinity,
                  height: 45,
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  onPressed: (){
                    Result();
                  },child: Text('Calculate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                ),

                SizedBox(height: 20,),

                Text('Result => $result',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
