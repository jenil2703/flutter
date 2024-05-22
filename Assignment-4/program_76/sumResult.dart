import 'package:flutter/material.dart';

class SumResultScreen extends StatelessWidget {
  final double result;

  SumResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Result => ${result}")
          ],
        ),
      ),
    );
  }
}