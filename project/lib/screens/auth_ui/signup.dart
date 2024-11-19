import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupState();
}

class _SignupState extends State<SignupScreen> {
  final TextEditingController _number = TextEditingController();

  String? _firstName;
  String? _lastName;
  String? _mobilenumber;
  String? _password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('SIGNUP'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        hintText: 'Enter first name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.greenAccent[70]),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Enter last name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.greenAccent[70]),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Enter mobile number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.greenAccent[70],
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a mobile number';
                      }
                      if (value.length != 10) {
                        return 'Mobile number must be 10 digits';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _mobilenumber = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.greenAccent[70]),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      _password = value;
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.greenAccent[70]),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    minWidth: 200,
                    color: Colors.red,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () async {
                      print("clicked");

                      _submitForm();
                    },
                    child: const Text('Signup using OTP',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      http.post(
          Uri.parse(
              "https://jenil2703.000webhostapp.com/projectAPI/signup.php"),
          body: {
            "fname": _firstName.toString(),
            "lname": _lastName.toString(),
            "mobile": _mobilenumber.toString(),
            "password": _password.toString(),
          });

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Login()));
    }
  }
}
