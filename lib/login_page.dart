import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'dash_board.dart';
import 'fields.dart';


class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _validateCredentials() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Connect to the PostgreSQL database
    final conn = PostgreSQLConnection('localhost', 5432, 'myfirstpostgresDB',username:'postgres',password:'Jas@lisa27');

    await conn.open();

    try {
      // Execute a SELECT query to check if the username and password are valid
      final results = await conn.query(
        'SELECT COUNT(*) FROM Users WHERE username = @username AND password = @password',
        substitutionValues: {'username': username, 'password': password},
      );

      final count = results[0][0] as int;
      if (count == 1) {
        // Valid credentials
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashBoard()),
            );
      } else {
        // Invalid credentials
        print('Invalid username or password');
      }
    } finally {
      // Close the database connection when done
      await conn.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            title: Icon(Icons.logo_dev_outlined,size: 200.0),
            backgroundColor: Color.fromARGB(255, 13, 13, 13),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle the press event for the leading icon
              },
            ),
            actions: [
              
              
            ],
          ),
        ),
      
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
          child: Container(
            width: 300,
            height: 400,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 228, 220, 228),
              borderRadius: BorderRadius.circular(10),
              
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.logo_dev_outlined,size: 200.0),
                TextField(
      controller: _usernameController,
      decoration: InputDecoration(

        labelText: 'Username',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
                // TextField(
                  
                //   controller: _usernameController,
                //   textAlign: TextAlign.center,
                //   decoration: InputDecoration(hintText: 'Username'),
                // ),
                SizedBox(height: 10),
                // TextField(
                //   controller: _passwordController,
                //   textAlign: TextAlign.center,
                //   obscureText: true,
                //   decoration: InputDecoration(hintText: 'Password'),
                // ),
                TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(

        labelText: 'Password',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _validateCredentials,
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
