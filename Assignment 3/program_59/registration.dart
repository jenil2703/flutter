import 'package:flutter/material.dart';
import 'package:program_59/main.dart';

class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Registration"),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            RegistrationForm()
          ],
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(25.00),
          child: Column(
            children:
            [
              Text("Signup",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.blue)),
              SizedBox(height: 50,),

              TextFormField(
                controller:email,
                decoration: InputDecoration(hintText: "Enter Your Email",border: OutlineInputBorder()),
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25,),

              TextFormField(
                controller:password1,
                decoration: InputDecoration(hintText: "Enter Your Password",border: OutlineInputBorder()),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password with at least 8 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25,),

              TextFormField(
                controller:password2,
                decoration: InputDecoration(hintText: "Enter Your Password",border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password with at least 8 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25,),

              MaterialButton(onPressed: (){
                if(_formKey.currentState!.validate())
                {
                  String email1 = email.text.toString();
                  String pass1 = password1.text.toString();
                  String pass2 = password1.text.toString();


                  if(email1=="a@gmail.com" && pass1=="1234" && pass2=="1234")
                  {
                    print("Logged in Succesfully");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                  }
                  else
                  {
                    print("Invalid Credentials");
                  }
                }
              },child: Text("Signup",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                shape: OutlineInputBorder(),
                minWidth: double.infinity,
                color: Colors.blue,),
              SizedBox(height: 25,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text("Already have an account?"),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                    },child: Text("Login",style: TextStyle(color: Colors.blue),),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

