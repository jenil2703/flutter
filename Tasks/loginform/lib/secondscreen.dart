import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  late SharedPreferences sharedPreferences;
  late String email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(()
    {
      email = sharedPreferences.getString('email')!;
    });
  }

  //////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROJECT 2'),backgroundColor: Colors.blueGrey,
        actions:
        [
          IconButton(onPressed: ()
          {
            showAlertDialog(context);
            sharedPreferences.setBool('login',true);

          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network('https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRHRb3zaPNGVvqnfsME6PDwgcd6sGH6Q_DCKnJsdXsA_L0t4z0fhubSJ72rKkgIEPJiYv9yDS7a_oG0rSOAwDl-RbbrPs5JkmOMYmt7A1nbsuWppAAuhiIrRlJ-&usqp=CAE',height: 250,width: 230),
              Text('Apple iPhone 14',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal)),
              Text('69,900',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal),),

              Image.network('https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTJOzF9mYOeC9j5slY4Gh7apohMrX_aldnmSiN7VHWKhAhQWB0P9_kLrfREGm6tD2_CkeqWXu9yYPKYtmfvh2OqEGOr5XcrrBXojSkWjn-HtUu_E-LTztP_&usqp=CAE',height: 250,width: 230),
              Text('Apple iPhone 14 Pro',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
              Text('1,20,000',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal),),

              Image.network('https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQstMGgxTe4N3pkvUcSkd9QmMwTZjvnhnfa_VznSrc8u7LC9dlVqx_orBLcTXh77lwR41H0L4Ar-5IaCSIZi-ioBwFWgzI7QH7X2xDAG9-nFe-VW8HL1_ap&usqp=CAE',height: 250,width: 230),
              Text('Apple iPhone 14 Pro Max',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
              Text('1,29,900',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal),),

              Image.network('https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQTFl3WPS-_PcqqPl4SzClPuE6ysMInCKjPIZ3QYp4Flg_1_uxx_jiknBVaDRLvfqZ15W2EFDZ-ycz_VyTNzuZ7QrHW-sRkfY7NKd57YZpT_Gk_rgMqfytd&usqp=CAE',height: 250,width: 230),
              Text('Apple iPhone 15',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
              Text('79,900',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal),),

              Image.network('https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgBaYmwA8uErZ1RvderZNgCWPqK6PbTPKE_EjYZcE1C0XOqIdoSheuilUUMdy6fp7FXFran-AOzvVU5nwuxMJB_YbFbqmUpu9akChmEBqXrcCOggWg9twphXw&usqp=CAE',height: 250,width: 230),
              Text('Apple iPhone 15 Pro',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
              Text('1,34,900',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal),),

              Image.network('https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRO3ypw-k8pph9tBN_8JE6hqB8gz1aOGNfNCYXoVVSW_fEj9euHEybpBej6H_jrNdxU1BblFdMuZdG-srEl1YEMAceKskRBuX1se5tZBDEE&usqp=CAE',height: 250,width: 230),
              Text('Apple iPhone 15 Pro Max',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
              Text('1,59,900',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.teal),),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()
      {  },child: Icon(Icons.add),backgroundColor: Colors.blueGrey,),
    );
  }

  void showAlertDialog(BuildContext context)
  {
    Widget cancleButton = ElevatedButton
      (
      child: Text("Cancle"),
      onPressed: ()
      {
        Navigator.of(context).pop();
      },
    );

    Widget okButton = ElevatedButton
      (
      child: Text("OK"),
      onPressed: ()
      {
        sharedPreferences.setBool('mylogin', true);

        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => MyLoginPage()));
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Confirm Logout'),
      content: Text('Are you sure you want to logout?'),
      actions:
      [
        cancleButton,okButton
      ],
    );
    showDialog(context: context, builder: (BuildContext context)
      {
        return alert;
      }
    );
  }


}
