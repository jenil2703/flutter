import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';

void main()
{
  runApp(MaterialApp(home: myapp(),debugShowCheckedModeBanner: false,theme: ThemeData(primarySwatch: Colors.blue),));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone call permission"),),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              MaterialButton(
                  color: Colors.blue.shade300,
                  onPressed: (){
                    _makePhoneCall();
              },child: Icon(Icons.call),
              ),
            ],
          ),
        ),
    );
  }

  void _requestPermissions()async
  {
    var status = await Permission.phone.status;
    if(!status.isGranted)
      {
        await Permission.phone.request();
      }
  }

  void _makePhoneCall() async {
    await FlutterPhoneDirectCaller.callNumber("6353777048");
  }
}
