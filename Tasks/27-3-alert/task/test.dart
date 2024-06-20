
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyAlert1 extends StatefulWidget
{
  const MyAlert1({super.key});

  @override
  State<MyAlert1> createState() => _MyAlert1State();
}



class _MyAlert1State extends State<MyAlert1> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Example"),),
      body: Center(
        child: Column
          (

          //buttons
          children:
          [

            ElevatedButton(onPressed: () {
              showAlertDialog(context);
            }, child: Text("Giffy example")),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () {
              textalert(context);
            }, child: Text("Text Alert")),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () {
              simpleAlert(context);
            }, child: Text('simpleAlert')),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () {
              simpleDialog(context);
            }, child: Text('simpleAlert2')),

          ],

        ),),);
  }


  //showAlert dialog
  void showAlertDialog(BuildContext context) {
    SimpleDialog alert = SimpleDialog(
      children: [
        SimpleDialogOption(
          child: Image.network(
            "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
            fit: BoxFit.cover, height: 200,),
        ),

        SimpleDialogOption(
          child: Text("Granny Eating Chocolates",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ),

        SimpleDialogOption(
          child: Text(
            'This is a granny eating dialog box. This library helps you easily create fancy giffy dialog.',
            style: TextStyle(fontSize: 15),),
        ),

        SimpleDialogOption(
          child: Center(
            child: Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("CANCLE")),

                SizedBox(width: 10,),

                ElevatedButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text("OK"),
                  )
              ],
            ),
          )
        ),
      ],
    );

    showDialog
      (
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  //text alert dialog box
  void textalert(BuildContext context) {
    Widget okButton = ElevatedButton
      (
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget cancleButton = ElevatedButton
      (
      child: Text("CANCLE"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog
      (
      title: Text("Login"),
      content: Column(

        children: [
          TextFormField(controller: email,
            decoration: InputDecoration(hintText: 'Enter Your Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder()),),
          SizedBox(height: 25,),
          TextFormField(controller: pass,
            decoration: InputDecoration(hintText: 'Enter Your Password',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder()),
            obscureText: true,)
        ],

      ),
      actions:
      [
        okButton, cancleButton
      ],
    );
    showDialog
      (
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  //simple alert
  void simpleAlert(BuildContext context) {
    SimpleDialog alert = SimpleDialog(

      children: [

        SimpleDialogOption(
            child: Lottie.asset('assets/anim2.json')
        ),

        SimpleDialogOption(
          child: Text('YES!', style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 45, color: Colors.red),
              textAlign: TextAlign.center),
        ),

        SizedBox(height: 5,),

        SimpleDialogOption(
          child: Text(
            'Everything is working...', style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,),
        ),

        SimpleDialogOption(
          child: ElevatedButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text('CONTINUE'),
          ),
        )
      ],
    );
    showDialog
      (
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //simple alert2
  void simpleDialog(BuildContext context) {
    SimpleDialog alert = SimpleDialog(
      children: [
        SimpleDialogOption(
            child: Lottie.asset('assets/anim3.json')
        ),

        SimpleDialogOption(
          child: Text('UH-SNAP!', style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 45, color: Colors.red),
              textAlign: TextAlign.center),
        ),

        SizedBox(height: 10,),

        SimpleDialogOption(
          child: Text('Something went wrong', style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,),
        ),

        SimpleDialogOption(
          child: ElevatedButton(onPressed: () {
            simpleAlert(context);
          }, child: Text('GO BACK'),
          ),
        )
      ],
    );

    showDialog(context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
