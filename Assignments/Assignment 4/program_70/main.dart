import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>
  [
    Text('Gallery Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Audio Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Video Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar
        (
          items:
          [
            BottomNavigationBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(Icons.browse_gallery_outlined),
                label: "Gallery",
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(Icons.audio_file_outlined),
              label: "Audio",
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(Icons.video_collection_outlined),
              label: "Video",
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
        ),
    );
  }
}

