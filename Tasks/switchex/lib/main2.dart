import 'package:flutter/material.dart';

class secondscreen extends StatefulWidget {
  const secondscreen({super.key});

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {

  //bottom navigator code part...
  int selectedIndex = 0;

  static const List<Widget> WidgetOption = <Widget>
  [
    Text('Home page',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
    Text('Search page',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green),),
    Text('Profile page',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.indigo),),
  ];

  void onItemTap(int index)
  {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Drawer'),),

      //drawer code
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text('Jenil Dobariya'), accountEmail: Text('jenil.dobariya077@gmail.com'),currentAccountPicture: CircleAvatar
              (
                backgroundColor: Colors.red[50],
              child: Text('J',style: TextStyle(fontSize: 40.00),),
              ),),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: ()
              {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notofication'),
              onTap: ()
              {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: ()
              {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: ()
              {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),

      body: Center
        (
        child: WidgetOption.elementAt(selectedIndex),
      ),

      //Bottom navigator code
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black87,
        iconSize: 35,
        onTap: onItemTap,
        elevation: 5,

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red[900]
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.green[900]
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.indigo[900]
          )
        ],
      ),
    );
  }
}
