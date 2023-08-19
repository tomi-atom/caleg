
import 'package:flutter/material.dart';
import 'package:caleg/update_relawan.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body:SingleChildScrollView(
          child:Container(
              child:Column(children:<Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),


              ]),

    ),
        ),
      ),
    );
  }

  void moveTo() {

  }


}

