import 'package:flutter/material.dart';
import 'login_page.dart';


class Logout extends StatefulWidget {

  @override
  _LogoutState createState() => _LogoutState();
}
class _LogoutState extends State<Logout> {

  @override
  Widget build(BuildContext context){
    return 
    Container(
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
      
      child: Column(
        children: [  
          Text(
  'Account Name:',
  style: TextStyle(
    fontSize: 20, // set font size
    fontWeight: FontWeight.bold, // set font weight
    fontStyle: FontStyle.normal, // set font style
    color: Colors.black54, // set font color
  ),
),
Text(
  'Pending items:',
  style: TextStyle(
    fontSize: 20, // set font size
    fontWeight: FontWeight.bold, // set font weight
    fontStyle: FontStyle.normal, // set font style
    color: Colors.black54, // set font color
  ),
),
          SizedBox(height: 10),

          ElevatedButton(
                  child: Text('Logout'),onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  },
                ),
        ],
      ),
    );
  }
}