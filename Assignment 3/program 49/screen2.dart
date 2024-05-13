import 'package:flutter/material.dart';

class screen2 extends StatefulWidget {
  const screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("screen 2"),backgroundColor: Colors.blueGrey,),
      body: Padding(padding: EdgeInsets.all(20.0),
      child: Column(
        children: 
        [
          Container(
            child: Image.asset("assets/img.jpg",height: 250,width: double.infinity,),
          ),
          SizedBox(height: 10,),

          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                    [
                      Text("Oeschinen Lake Campground",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Switzerland")
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(right: 15),
                  child: Row(
                    children:
                    [
                      Icon(Icons.star,color: Colors.amber[900],),
                      SizedBox(width: 5,),
                      Text("40")
                    ],
                  ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Column(
                  children:
                  [
                    Icon(Icons.call,color: Colors.blue),
                    Text("CALL",style: TextStyle(color: Colors.blue)),
                  ],
                ),

                Column(
                  children:
                  [
                    Icon(Icons.send_rounded,color: Colors.blue),
                    Text("ROUTE",style: TextStyle(color: Colors.blue)),
                  ],
                ),

                Column(
                  children:
                  [
                    Icon(Icons.share,color: Colors.blue),
                    Text("SHARE",style: TextStyle(color: Colors.blue)),
                  ],
                )
              ],
            ),
          ),
          
          Padding(padding: EdgeInsets.all(15.0),
            child: Text("Lake Oeschinen lies at the foot of the Bluemlisalp in the "
                "Bernese Alps.Situated 1,578 meters above sea level, it is one "
                "of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a "
                "half-hour walk through pastures and pine forest, leads you to "
                "the lake, which warms to 20 degress Celsius in the summer.Activities "
                "enjoyed here include rowing, and riding the summer toboggan run."),
          ),

        ],
      ),
      ),
    );
  }
}
