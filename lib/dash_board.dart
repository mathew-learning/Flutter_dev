import 'package:cs_app/fields.dart';
import 'package:cs_app/jus_login.dart';
import 'package:cs_app/dash_board.dart';
import 'package:flutter/material.dart';
////import 'home_page.dart';
import 'download_reports.dart';
import 'pro.dart';
import 'download_reports.dart';
import 'settings.dart';
import 'jus_login.dart';
import 'fields.dart';





class DashBoard extends StatefulWidget {
  // ///final String title;

  // const DashBoard({
  //   required this.title,
  // });

  void dashBoardOption(){
    Text('Building');
  }


  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;
  bool isExtended = false;

  final selectedColor = Colors.white;
  final unselectedColor = Colors.white60;
  final labelStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // title: Text(widget.title),
        ),
        body: Row(
          children: [
            NavigationRail(
              backgroundColor: Theme.of(context).primaryColor,
              labelType: NavigationRailLabelType.all,
              selectedIndex: index,
              extended: isExtended,
              groupAlignment: 0,
              selectedLabelTextStyle: labelStyle.copyWith(color: selectedColor),
              unselectedLabelTextStyle:
                  labelStyle.copyWith(color: unselectedColor),
              selectedIconTheme: IconThemeData(color: selectedColor, size: 50),
              unselectedIconTheme:
                  IconThemeData(color: unselectedColor, size: 50),
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.admin_panel_settings_rounded),
                  selectedIcon: Icon(Icons.admin_panel_settings_outlined),
                  label: Text('Admin'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.download_for_offline_rounded),
                  selectedIcon: Icon(Icons.download_for_offline_rounded),
                  label: Text('Reports'),
                  
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.settings_accessibility_outlined),
                  selectedIcon: Icon(Icons.settings_accessibility_rounded),
                  label: Text('Settings'),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.person_2_outlined),
                  selectedIcon: Icon(Icons.person_2_rounded),
                  label: Text('Profile'),
                ),
                
                NavigationRailDestination(
                  icon: Icon(Icons.logout_outlined),
                  label: Text('Logout'),
                ),
                
              ],
            ),
            Expanded(child: buildPages()),
    
            // Container(
            //   child: MyCustomForm(),
            // ),
          
          ],
        ),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return NamePage();
      case 1:
        return DownloadReportsPage();
      case 2:
        return SettingsPage();
      case 3:
        return ProfilePage();
      case 4:
        return LoginPage();
      default:
        return NamePage();
    }
  }
}

          
         
    

  

