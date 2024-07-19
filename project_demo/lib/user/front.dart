import 'package:flutter/material.dart';
import 'package:project_demo/user/user_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
import 'download.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {

  late SharedPreferences sharedPreferences;
  late String mob;

  @override
  void initState()
  {
    // TODO: implement initState
    //super.initState();
    initial();
  }
  void initial()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      mob = sharedPreferences.getString('mob')!;
    });
  }

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>
  [
    UserDashboardScreen(),
    Download(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Dashboard',style: TextStyle(fontWeight: FontWeight.bold)),actions:
      [
        IconButton(onPressed: ()
        {
          sharedPreferences.setBool('project', true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }, icon: Icon(Icons.logout))
      ],),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: ('Download'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
