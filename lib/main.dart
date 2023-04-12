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
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Admin'),
        ),
        body: LoginPage(title:'Admin'),
      ),
    );
  }
}

