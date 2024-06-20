import 'package:flutter/material.dart';

class secondscreen extends StatefulWidget {
  //const secondscreen({super.key});
  int index;
  secondscreen({required this.index});

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {

  late int data;
  late String title,subtitle,trailing;
  late var leading;

  @override

  void initState() {
    // TODO: implement initState
    data = widget.index;

    if(data==0)
      {
        leading = "assets/profile.png";
        title = "Jenil Dobariya";
        subtitle = "Resume";
        trailing = "10 March";
      }

    if(data==1)
    {
      leading = "assets/profile.png";
      title = "Jay Patel";
      subtitle = "Assignment upload";
      trailing = "12 March";
    }

    if(data==2)
    {
      leading = "assets/profile.png";
      title = "Amazon";
      subtitle = "Amazon seller notification";
      trailing = "15 March";
    }

    if(data==3)
    {
      leading = "assets/profile.png";
      title =  "Google Security";
      subtitle = "Security alert";
      trailing = "20 March";
    }

    if(data==4)
    {
      leading = "assets/profile.png";
      title = "Microsoft account team";
      subtitle =  "Microsoft account security code";
      trailing = "27 March";
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Image.asset(leading,width: double.infinity,),
            Text(title,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text(subtitle,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300)),
            Text(trailing,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200))
          ],
        ),
      ),
    );
  }
}
