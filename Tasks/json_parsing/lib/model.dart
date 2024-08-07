import 'package:flutter/material.dart';

class Model extends StatelessWidget
{
  late List list;
  Model({required this.list});


  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index)
        {
          return Padding(padding: EdgeInsets.only(top: 8.0),
          child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
          color: Colors.red[100],
          child: ListTile
            (
              leading: Image.network(list[index]['imageurl'],width: 100,height: 200,),
              title: Text(list[index]['name'],style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                children:
                [
                  Container(
                    child: Text(list[index]['realname']),
                    alignment: Alignment.topLeft,
                  ),

                  Container(
                    child:  Text(list[index]['team']),
                    alignment: Alignment.topLeft,
                  ),

                  Container(
                    child: Text(list[index]['firstappearance']),
                    alignment: Alignment.topLeft,
                  ),

                  Container(
                    child: Text(list[index]['createdby']),
                    alignment: Alignment.topLeft,
                  ),

                  Container(
                    child: Text(list[index]['publisher']),
                    alignment: Alignment.topLeft,
                  ),

                  Container(
                    child: Text(list[index]['bio']),
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ),


          ));
        });
  }
}