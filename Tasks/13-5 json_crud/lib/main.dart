import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'addpage.dart';
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

  Future<List> getdata()async
  {
    var url = Uri.parse("https://jenil2703.000webhostapp.com/crudAPI/view.php");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }

  Future<List> pullrefresh()async
  {
    var url = Uri.parse("https://jenil2703.000webhostapp.com/crudAPI/view.php");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Json Crud App"),),
      body: RefreshIndicator(
        onRefresh: pullrefresh,
        child: Center
          (
          child: FutureBuilder<List>
            (
            future: getdata(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot)
            {
              if(snapshot.hasData)
              {
                return Model(list:snapshot.data!!);
              }
              if(snapshot.hasError)
              {
                print('Network Not Found');
              }

              return CircularProgressIndicator();
            },),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(context,MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),
      ),);

  }




}