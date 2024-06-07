import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup',style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              TextFormField(
                controller: _fname,
                decoration: InputDecoration(label: Text('FIRST NAME'),border: OutlineInputBorder()),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required a Firstname';
                  }
                },
              ),
              SizedBox(height: 15,),

              TextFormField(
                controller: _lname,
                decoration: InputDecoration(label: Text('LAST NAME'),border: OutlineInputBorder()),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required a Lastname';
                  }
                },
              ),
              SizedBox(height: 15,),

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
                  _insertData();
                  print('Inserted');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },child: Text('Signup',style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text('Already have an account?',style: TextStyle(fontSize: 20)),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },child: Text('Login',style: TextStyle(color: Colors.blue,fontSize: 20),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insertData()
  {
    http.post(Uri.parse("https://topstech8.000webhostapp.com/CRUDAPI/register.php"),body:
    {
      "fname":_fname.text.toString(),
      "lname":_lname.text.toString(),
      "email":_email.text.toString(),
      "password":_password.text.toString()
    });
  }
}
