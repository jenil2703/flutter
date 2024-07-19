
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

void main()
{
  runApp(MaterialApp(home:LoginForm(),debugShowCheckedModeBanner: false,));
}
class LoginForm extends StatefulWidget
{
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
{
  late SharedPreferences sharedPreferences;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  late bool newuser;
  @override
  void initState()
  {
    // TODO: implement initState
    //super.initState();

    checklogin();
  }

  void checklogin() async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('mylogin') ?? true);
    print(newuser);

    if (newuser == false)
    {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => DashboardPage()));
    }

  }

  @override
  void dispose()
  {
    // TODO: implement dispose
    super.dispose();

    email.dispose();
    pass.dispose();

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Login Form"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            TextFormField(controller: email,decoration: InputDecoration(hintText: "Enter Your Email",labelText: "Email",icon: Icon(Icons.email),border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            TextFormField(controller: pass,obscureText:true,decoration: InputDecoration(hintText: "Enter Your Password",labelText: "Password",icon: Icon(Icons.password),border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {

              if(email.text.toString()=="tops@gmail.com" && pass.text.toString()=="1234")
              {
                sharedPreferences.setBool('mylogin', false);
                sharedPreferences.setString('myemail',email.text.toString() );

                Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardPage()));
                print("Logged in succesfully");
              }
              else
              {
                print("Invalid Credentials");
              }

            }, child: Text("Login"))

          ],
        ),
      ),
    );
  }


}
