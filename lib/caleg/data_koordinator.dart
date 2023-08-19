
import 'package:flutter/material.dart';
import 'package:caleg/update_relawan.dart';


class DataKordinator extends StatefulWidget {
  @override
  _DataKordinatorState createState() => _DataKordinatorState();
}

class _DataKordinatorState extends State<DataKordinator> {

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

