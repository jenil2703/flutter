
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class DashboardPage extends StatefulWidget
{
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
{
  late SharedPreferences sharedPreferences;
  late String email;

  @override
  void initState()
  {
    // TODO: implement initState
    //super.initState();
    initial();

  }
  void initial() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(()
    {
      email = sharedPreferences.getString('myemail')!;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Welcome $email"),
      actions:
      [
        IconButton(onPressed: ()
        {

          sharedPreferences.setBool('mylogin', true);
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => LoginForm()));

        }, icon: Icon(Icons.logout))
      ],),);
  }


}
