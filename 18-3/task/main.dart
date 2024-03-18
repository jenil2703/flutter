import 'package:flutter/material.dart';

void main() {
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PROJECT 2'),
          backgroundColor: Colors.blueGrey,
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
      ),
    );
  }

}
