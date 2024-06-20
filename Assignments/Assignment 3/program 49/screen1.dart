import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {


  List<String> color =
  [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 1"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: 
            [
              Container
                (
                  color: Colors.red,
                  height: 200,
                ),
              SizedBox(height: 10,),
          
              Container
                (
                  child: GridView.count
                    (
                      crossAxisCount: 2,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      shrinkWrap: true,
                      children: List.generate(4, (index){
                        return Container
                          (
                            color: Colors.yellow,
                          );
                      }),
                    ),
                ),
          
              SizedBox(height: 10,),
          
              Container
                (
                  child: GridView.count
                    (
                      crossAxisCount: 3,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      shrinkWrap: true,
                      children: List.generate(9, (index){
                        return Container
                          (
                            color: Colors.blue,
                          );
                      }),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
