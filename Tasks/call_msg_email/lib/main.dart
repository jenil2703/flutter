import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Call Msg and Email"),
        actions:
        [
          IconButton(onPressed: () {
            _makecall("6353777048");
          }, icon: Icon(Icons.call)),

          IconButton(onPressed: () {
            _makesms("6353777048");
          }, icon: Icon(Icons.sms)),

          IconButton(onPressed: () {
            _makeemail("jenil.dobariya077@gmail.com");
          }, icon: Icon(Icons.email)),


        ],
      ),
    );
  }
}

  void _makecall(String number) async
  {
    var url = Uri.parse("tel: $number");
    if(await canLaunchUrl(url))
      {
        await launchUrl(url);
      }
    else
      {
        throw 'Could not launch $url';
      }
  }

  void _makesms(String number) async
  {
    var url = Uri.parse("sms: $number");
    if(await canLaunchUrl(url))
    {
    await launchUrl(url);
    }
    else
    {
    throw 'Could not launch $url';
    }
  }

  void _makeemail(String email) async
  {
    var url = Uri.parse("mailto: $email");
    if(await canLaunchUrl(url))
    {
    await launchUrl(url);
    }
    else
    {
    throw 'Could not launch $url';
  }
}

