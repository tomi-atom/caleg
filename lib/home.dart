import 'package:caleg/caleg/data_relawan.dart';
import 'package:caleg/page/filter_network_list_page.dart';
import 'package:caleg/page/filter_relawan_list_page.dart';
import 'package:flutter/material.dart';
import 'package:caleg/update_relawan.dart';
import 'package:caleg/profile.dart';
import 'package:caleg/update_data.dart';
import 'package:caleg/input_relawan.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MaterialApp(
    // Title
      title: "Tabs",
      // Home
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

// SingleTickerProviderStateMixin is used for animation
class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // Create a tab controller
  late TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('EXE RELAWAN'))
          ],

        ),


      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[InputRelawan(), UpdateRelawan(), FilterRelawanListPage()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blueAccent,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.home),
              text: "Input Relawan",
            ),
            Tab(
              icon: Icon(Icons.fact_check),
              text: "Update Data",
            ),
            Tab(
              icon: Icon(Icons.recommend),
              text: "Data Relawan",

            ),

          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}