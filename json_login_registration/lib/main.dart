import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_login_registration/dashboard.dart';
import 'package:json_login_registration/signup.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  late SharedPreferences sharedPreferences;
  late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(label: Text('EMAIL'),border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required an Email';
                  }
                },
              ),
              SizedBox(height: 15,),

              TextFormField(
                controller: _password,
                decoration: InputDecoration(label: Text('PASSWORD'),border: OutlineInputBorder()),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required a Password';
                  }
                },
              ),
              SizedBox(height: 15,),

              MaterialButton(
                minWidth: 250,
                color: Colors.blue,
                onPressed: (){
                  _login();
                },child: Text('Login',style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 15,),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text('Dont have an account?',style: TextStyle(fontSize: 20),),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    },child: Text('Signup',style: TextStyle(color: Colors.blue,fontSize: 20),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login()async
  {
    var response = await http.post(Uri.parse('https://topstech8.000webhostapp.com/CRUDAPI/login.php'),body:
    {
      'email':_email.text.toString(),
      'password':_password.text.toString(),
    });

    var data = jsonDecode(response.body);
    if(data==0)
      {
        print('fail');
        final snackbar = SnackBar(content: const Text('Login Fail'),);
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    else
      {
        print('sucess');
        sharedPreferences.setBool('mylogin', false);
        sharedPreferences.setString('myemail', _email.text.toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void checkLogin()async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('mylogin')??true);
    print(newuser);
    if(newuser==false)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
  }
}

