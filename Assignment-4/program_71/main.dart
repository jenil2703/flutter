import 'package:flutter/material.dart';
import 'package:program_71/audio.dart';
import 'package:program_71/gallery.dart';
import 'package:program_71/video.dart';

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

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Drawer"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Text("HOME PAGE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 7.0)),
      ),
      drawer: Drawer
        (
          child: ListView
            (
              padding: EdgeInsets.zero,
              children:
              [
                SizedBox(height: 80,),
                ListTile(
                  shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  leading: Icon(Icons.browse_gallery_outlined),
                  title: Text("Gallery",style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryPage()));
                  },
                ),
                SizedBox(height: 2,),

                ListTile(
                  shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  leading: Icon(Icons.audio_file_outlined),
                  title: Text("Audio",style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AudioPage()));
                  },
                ),
                SizedBox(height: 2,),


                ListTile(
                  shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  leading: Icon(Icons.video_collection_outlined),
                  title: Text("Video",style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage()));
                  },
                ),
              ],
            ),

      ),
    );
  }
}

