import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:SwitchEx(),debugShowCheckedModeBanner: false,));
}
class SwitchEx extends StatefulWidget
{
  const SwitchEx({super.key});

  @override
  State<SwitchEx> createState() => _SwitchExState();
}

class _SwitchExState extends State<SwitchEx>
{
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Switch Example"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            Transform.scale(scale: 2,),
            Switch
              (
              value: isSwitched,
              onChanged: toggleSwitch,
              activeColor: Colors.blue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.amber[900]
            ),

            Text('$textValue', style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }

  void toggleSwitch(bool value)
  {
    if(isSwitched==false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is On';
        audioPlayer.play(AssetSource('song.mp3'));
      });
      print('Switch Button is ON');
    }
    else
    {
      audioPlayer.stop();
      setState(()
      {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
}
