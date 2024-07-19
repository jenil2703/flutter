import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool a=false, b=false, c=false;
  var total=0, amount=0, data="";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox EX"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Cafe ordering system"),

            SizedBox(height: 10,),

            CheckboxListTile(
                title: Text('Pizza'),
                subtitle: Text('Rs.100'),
                value: a,
                onChanged: (value)
                {
                  setState(() {
                    this.a = value!;

                    if(a==true)
                      {
                        amount+=100;
                        data+='\n Pizza @ Rs.100';
                      }
                    else
                      {
                        amount-=100;
                      }
                  });
                }
            ),
            
            CheckboxListTile(
                title: Text('Burger'),
                subtitle: Text('Rs.80'),
                value: b, 
                onChanged: (value)
                {
                  setState(() {
                    this.b = value!;
                    
                    if(b==true)
                      {
                        amount+=80;
                        data+='\n Burger @ Rs.80';
                      }
                    else
                      {
                        amount-=80;
                      }
                  });
                }
            ),
            
            CheckboxListTile(
                title: Text('Coffee'),
                subtitle: Text('Rs.120'),
                value: c,
                onChanged: (value)
                {
                  setState(() {
                    this.c = value!;

                    if(c==true)
                      {
                        amount+=120;
                        data+='\n Coffee @ Rs.120';
                      }
                    else
                      {
                        amount-=120;
                      }
                  });
                }
            ),
            
            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
                {
                  Fluttertoast.showToast(
                    msg: "Bill $data \n Total Amount => $amount",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    fontSize: 20.00
                  );
                }, child: Text("Order")),
          ],
        ),
      ),
    );
  }
}

