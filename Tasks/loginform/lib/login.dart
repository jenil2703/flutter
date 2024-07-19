import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginform/secondscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Login Form'),),
     body: Center(
       child: LoginForm(),
     ),
   );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginForm>
{

  late SharedPreferences sharedPreferences;
  late bool newuser;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    checklogin();
  }

  void checklogin()async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('mylogin') ?? true);
    print(newuser);

    if(newuser==false)
      {
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => dashboard()));
      }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Form(
        key: _formKey,

          child: Container(
            margin: EdgeInsets.all(25),

            child: SingleChildScrollView(
              child: Column(
              
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              
                        children: [
              
              SizedBox(height: 70,),
              //Text('Login',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 38,fontWeight: FontWeight.bold),),
              Image.asset('assets/logo1.png',scale: 1.0,),
              
              SizedBox(height: 50,),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Enter Your Email',prefixIcon: Icon(Icons.email),border: OutlineInputBorder()),
                validator: (value)
              {
                if(value!.isEmpty)
                {
                  return 'Please Enter Your Email';
                }
                return null;
              }
              ),
              SizedBox(height: 30,),
              
              TextFormField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(hintText: 'Enter Password',prefixIcon: Icon(Icons.password),border: OutlineInputBorder()),
                obscureText: true,
                validator: (value)
                  {
                    if(value!.isEmpty)
                      {
                        return 'Please Enter Password';
                      }
                    return null;
                  }
              ),
              
              SizedBox(height: 30,),
              ElevatedButton(onPressed: ()
                  {
                    if(_formKey.currentState!.validate())
                      {
                        String email1 = email.text.toString();
                        String password1 = password.text.toString();
              
                        if(email1=="a@gmail.com" && password1=="12345")
                        {
                          sharedPreferences.setBool('mylogin', false);
                          sharedPreferences.setString('email', email.text.toString());


                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));
                          print('Logged in successfully');
                        }
                        else
                        {
                          print('Invalid credentials');
              
                        }
                      }
              
                  },
                child: Text('Login'),
              ),
              
                        ],
                      ),
            ),
      )),
    );
  }




}
