
import 'package:flutter/material.dart';
import 'package:caleg/update_relawan.dart';


class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {

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

