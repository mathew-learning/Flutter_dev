import 'package:flutter/material.dart';

import 'data_base.dart';
import 'display_data.dart';



class DashBoard extends StatefulWidget {


  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  void dashBoardOption(){
    Text('Building');
  }

  @override
  Widget build(BuildContext context) {
          final theme =  Theme.of(context);

    return Scaffold(
        
        backgroundColor: theme.colorScheme.surface,

        body: Row(children: [
          SafeArea(
            child:
             NavigationRail(
              extended: true,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.abc_rounded),
                  label: Text('Favorites'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.abc_rounded),
                  label: Text('option2'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.abc_sharp),
                  label: Text('option2'),
                ),
              ], selectedIndex: null,
              
            ),
          ),
         Expanded(
            child: Container(
              child: dashboardPageOne(),
            ),
          ),]

        )
      
      
   
    );
  }
}

class dashboardPageOne extends StatelessWidget{
    final companyName = TextEditingController();
    final state = TextEditingController();
    final city = TextEditingController();
    final address = TextEditingController();
    final contact = TextEditingController();
    final email = TextEditingController();
    


 


  @override
  Widget build(BuildContext context) {
    return  

          Column(
            
  children: [TextField(
              keyboardType: TextInputType.text,
              controller: companyName,

              decoration: InputDecoration(
              hintText: 'Company Name',
              border: OutlineInputBorder(),
              
            ),
            
            ),
          TextField(
              
              keyboardType: TextInputType.visiblePassword,
              controller: state,

              decoration: InputDecoration(
              hintText: 'State',
              border: OutlineInputBorder(),
              
            ),
            
            ),
            TextField(
              
              keyboardType: TextInputType.visiblePassword,
              controller: city,

              decoration: InputDecoration(
              hintText: 'City',
              border: OutlineInputBorder(),
              
            ),
            
            ),
            TextField(
              
              keyboardType: TextInputType.visiblePassword,
              controller: address,

              decoration: InputDecoration(
              hintText: 'Address',
              border: OutlineInputBorder(),
              
            ),
            
            ),
            TextField(
              
              keyboardType: TextInputType.visiblePassword,
              controller: contact,

              decoration: InputDecoration(
              hintText: 'Contact',
              border: OutlineInputBorder(),
              
            ),
            
            ),
            TextField(
              
              keyboardType: TextInputType.visiblePassword,
              controller: email,

              decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
              
            ),
            
            ),
            
            // TextField(
              
            //   keyboardType: TextInputType.visiblePassword,
            //   decoration: InputDecoration(
            //   hintText: 'Password',
            //   border: OutlineInputBorder(),
              
            // ),
            
            // ),
            const SizedBox(height: 16.0),
          ElevatedButton(onPressed:(){
              dbConnections(companyName.text,state.text,city.text,address.text,contact.text,email.text);
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DisplayDataPage()),
            );
            
          },
  child: const Text('Submit')),
    
    
  ],
);
   

  }

}