import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adminDashboard extends StatefulWidget {
  const adminDashboard({super.key});

  @override
  State<adminDashboard> createState() => _adminDashboardState();
}

class _adminDashboardState extends State<adminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Welcome to admin Dashboard'),),);
  }
}
