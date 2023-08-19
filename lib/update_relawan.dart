
import 'package:flutter/material.dart';
import 'package:caleg/update_relawan.dart';


class UpdateRelawan extends StatefulWidget {
  @override
  _UpdateRelawanState createState() => _UpdateRelawanState();
}

class _UpdateRelawanState extends State<UpdateRelawan> {

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
              getAppBarUI(),

            ]),

          ),
        ),

      ),
    );
  }

  void moveTo() {

  }


  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),

      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            child: Image.asset('images/logo.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Text(
                  'Aplikasi Pendataan Relwawan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 0.27,
                  ),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }

}

