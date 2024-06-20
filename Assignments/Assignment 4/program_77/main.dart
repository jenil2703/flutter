import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: myapp(),debugShowCheckedModeBanner: false,));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("URL Launcher"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
              _makeCall("6353777048");
            },child: Icon(Icons.call),
            ),
            SizedBox(height: 20,),

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
              _sendSMS();
            },child: Icon(Icons.sms),
            ),
          ],
        ),
      ),
    );
  }

  void _makeCall(String number)async
  {
    var url = Uri.parse("tel:$number");
    if(await canLaunchUrl(url))
      {
        await launchUrl(url);
      }
    else
      {
        throw 'Could not launch $url';
      }
  }

  void _sendSMS()async
  {
    var url = Uri.parse("sms:6353777048");
    if(await canLaunchUrl(url))
      {
        await launchUrl(url);
      }
    else
      {
        throw 'Could not launch $url';
      }
  }
}

