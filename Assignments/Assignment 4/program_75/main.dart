import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main()
{
  runApp(MaterialApp(
                theme: ThemeData(primarySwatch: Colors.blue),
                home: myapp(),debugShowCheckedModeBanner: false,));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> with WidgetsBindingObserver{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    String msg = '';

    switch(state){

      case AppLifecycleState.resumed:
        msg = "App Resumed";
        break;

      case AppLifecycleState.inactive:
        msg = "App Inactive";
        break;

      case AppLifecycleState.paused:
        msg = "App Paused";
        break;

      case AppLifecycleState.detached:
        msg = "App Detached";
        break;

      case AppLifecycleState.hidden:

    }showToast(msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity lifecycle"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Text("This is main screen"),
      ),
    );
  }

  void showToast(String msg)
  {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white
    );
  }
}
