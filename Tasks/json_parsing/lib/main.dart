import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

void main()
{
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  //parse the data from URL to response
  Future<List>viewdata() async
  {
    var url = Uri.parse("https://simplifiedcoding.net/demos/marvel/");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Json Parsing App"),),
        body:  FutureBuilder
          (
          future: viewdata(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot)
          {
            if(snapshot.hasData)
            {
              //print(snapshot.data);
              return Model(list:snapshot.data!!);

            }
            if(snapshot.hasError)
            {
              print("Network not found");
            }
            return CircularProgressIndicator();
          },

        )
    );



  }
}