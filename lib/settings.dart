import 'package:flutter/material.dart';

// import 'package:tabbar_without_appbarflutter/common/color_constants.dart';
class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}
class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
late TabController tabController;
  

@override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20,left: 15,right: 15,),
          child: Column(
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Color.fromARGB(253, 145, 243, 8),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),),
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                     color: Color.fromRGBO(54, 240, 8, 1),
                  ),
                  labelColor: Color.fromRGBO(3, 3, 3, 1),
                  unselectedLabelColor: Color.fromRGBO(0, 0, 0, 1),
                  tabs: [
                    Tab(
                      text: 'Company Creation',
                    ),
                    Tab(
                      text: 'Company Details',
                    ),
                      Tab(
                      text: 'Edit company',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                   controller: tabController,
                  children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: Column(
                       children: [
                         Text("Tab1"),
                       ],
                     ),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text("Tab2"),
                        ],
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: Column(
                         children: [
                           Text("Tab3"),
                         ],
                       ),
                     ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}