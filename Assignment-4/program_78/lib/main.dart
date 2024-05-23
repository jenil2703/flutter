import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:program_78/Addpage.dart';
import 'package:http/http.dart' as http;
import 'package:program_78/model.dart';


void main() {
  runApp(MaterialApp(home: Myapp(),debugShowCheckedModeBanner: false,));
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  Future<List> getdata()async
  {
    var url = Uri.parse("https://jenil2703.000webhostapp.com/API78/view.php");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }

  Future<List> pullrefresh()async
  {
    var url = Uri.parse("https://jenil2703.000webhostapp.com/API78/view.php");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Operations',style: TextStyle(fontWeight: FontWeight.bold)),),

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
                return Model(list:snapshot.data!);
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
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
        },child: Text("+",style: TextStyle(fontSize: 40),),
      )
    );
  }
}
