import 'package:flutter/material.dart';

//import 'jus_login.dart';
import 'login_page.dart';
//import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project jus',
      theme: ThemeData(
        primaryColor:  Color.fromARGB(255, 90, 239, 82),
          primarySwatch: MaterialColor(0xFF300B39, {
    50: Color.fromRGBO(48, 11, 57, .1),
    100: Color.fromRGBO(48, 11, 57, .2),
    200: Color.fromRGBO(48, 11, 57, .3),
    300: Color.fromRGBO(48, 11, 57, .4),
    400: Color.fromRGBO(48, 11, 57, .5),
    500: Color.fromRGBO(48, 11, 57, .6),
    600: Color.fromRGBO(48, 11, 57, .7),
    700: Color.fromRGBO(48, 11, 57, .8),
    800: Color.fromRGBO(48, 11, 57, .9),
    900: Color.fromRGBO(48, 11, 57, 1),
  }),
      ),
      home: Scaffold(
        
        body: LoginPage(),
      ),
    );
  }
}

