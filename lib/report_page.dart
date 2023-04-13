import 'package:flutter/material.dart';
import 'data_base.dart';
import 'display_data.dart';


class RESULTS extends StatefulWidget {


  @override
  State<RESULTS> createState() => _ResultsState();
}

class _ResultsState extends State<RESULTS> {



  @override
  Widget build(BuildContext context) {
          final theme =  Theme.of(context);

    return Scaffold(
        
        backgroundColor: theme.colorScheme.surface,

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
            child: Column(children: [
              ElevatedButton(
                child: Text('Reports'),onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayDataPage()),
                );
                },
              ),
          
            ],),
          ),
        )
      
      
   
    );
  }
}