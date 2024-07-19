import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_effect/splashconnection.dart';

void main()
{
  runApp(MaterialApp(home: splashscreen(),debugShowCheckedModeBanner: false,));
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
      appBar: AppBar(title: Text("Shimmer Effect"),backgroundColor: Colors.blueGrey,),
      body:Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.00,vertical: 16.00),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children:
          [
            Expanded(child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: ListView.builder(itemCount: 5,itemBuilder: (_, __) =>
                Padding(padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Container(
                        width: 48.0,
                        height: 48.0,
                        color: Colors.white,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),

                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            color: Colors.white,
                          ),

                          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            color: Colors.white,
                          ),

                          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                          Container(
                            width: 40.0,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            )),

          ],
        ),
      ),
    );
  }
}
