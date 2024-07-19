import 'package:flutter/material.dart';
import 'package:json_login_registration/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late SharedPreferences sharedPreferences;
  late String email;

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    initial();
  }

  void initial()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString('myemail')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome $email'),
      actions:
      [
        IconButton(onPressed: (){
          sharedPreferences.setBool('mylogin', true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        }, icon: Icon(Icons.logout)),
      ],),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children:
              [
                 
              ],
            ),
          ),
        ),
      ),
    );
  }


}
