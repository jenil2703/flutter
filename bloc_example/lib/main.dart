import 'package:bloc_example/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color _primaryColor = Colors.black;
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.white,

        buttonTheme: ButtonThemeData(
          buttonColor: _primaryColor,
          textTheme: ButtonTextTheme.primary,
          minWidth: double.infinity,
          height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        ),
      ),
    );
  }
}
