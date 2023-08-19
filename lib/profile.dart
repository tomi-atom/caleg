
import 'package:flutter/material.dart';
import 'package:caleg/update_relawan.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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

