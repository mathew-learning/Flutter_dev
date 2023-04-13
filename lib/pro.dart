
 

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueGrey[200] ?? Colors.grey,
  Colors.grey[100] ?? Colors.white,

            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
          child: Center(
            child: Text(
  'PROFILE',
  style: TextStyle(
    fontSize: 20, // set font size
    fontWeight: FontWeight.bold, // set font weight
    fontStyle: FontStyle.normal, // set font style
    color: Colors.black54, // set font color
  ),
),
          ),
        ),
      );
}