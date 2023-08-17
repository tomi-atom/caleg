import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:mnc_identifier_ocr/mnc_identifier_ocr.dart';
import 'package:mnc_identifier_ocr/model/ocr_result_model.dart';

class InputRelawan extends StatefulWidget {
  @override
  _InputRelawanState createState() => _InputRelawanState();
}

class _InputRelawanState extends State<InputRelawan> {
  late String errormsg;
  late bool error, showprogress;
  late String tanggallahir, tinggi;
  String apiurl = "http://udmami.com/stunting/index3.php"; //api url


  var _tinggi = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  String JK = "LK";
  String CaraUkur = "berbaring";

  OcrResultModel? result;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanKtp() async {
    OcrResultModel? res;
    try {
      res = await MncIdentifierOcr.startCaptureKtp(withFlash: true, cameraOnly: true);
    } catch (e) {
      debugPrint('something goes wrong $e');
    }

    if (!mounted) return;

    setState(() {
      result = res;
    });
  }

  _imgGlr() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    debugPrint('path: ${image?.path}');
  }

  _imgCmr() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    debugPrint('path: ${image?.path}');
  }


  @override
  void initState() {
    tinggi = "";
    tanggallahir = "";
    JK = "LK";
    CaraUkur = "berbaring";
    errormsg = "";
    error = false;
    showprogress = false;
    dateinput.text = "";

    //_username.text = "defaulttext";
    //_tinggi.text = "defaulttinggi";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      //color set to transperent or set your own color
    ));


    return Scaffold(
      body: Stack(
        children: [
          Text('Ktp data: ${result?.toJson()}'),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: scanKtp, child: const Text('PUSH HERE')),
                const SizedBox(height: 8),
                ElevatedButton(onPressed: _imgCmr, child: const Text('CAMERA')),
                const SizedBox(height: 8),
                ElevatedButton(onPressed: _imgGlr, child: const Text('GALLERY')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
              alignment: Alignment.center,
              child: Image.asset('assets/images/sevstunt.png'),

          ),

          content: const Text('Dianjurkan Untuk Konsultasi Ke Ahli Gizi'),

          actions: <Widget>[

            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  setDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/stunt.png'),

          ),
          content: const Text('Dianjurkan Untuk Konsultasi Ke Ahli Gizi'),
          actions: <Widget>[

            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  setDialog3(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/normal.png'),

          ),
          actions: <Widget>[

            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  setDialog4(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/tinggi.png'),

          ),

        actions: <Widget>[

            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  startHitung() async {

    var response = await http.post(Uri.parse(apiurl), body: {
      'umur': tanggallahir,
      'tinggi': tinggi,
      'jk': JK,
      'cara_ukur': CaraUkur
    });
    var jsondata = json.decode(response.body);
    var code = jsondata["code"];
    print(jsondata);
    if (code =="berhasil")
    {
       var hasil = jsondata["message"];
       if (hasil < -3){
         setDialog1(context);
       }else if (hasil >-3 && hasil < -2){
         setDialog2(context);
       }else if (hasil > 2){
         setDialog4(context);
       }else {
         setDialog3(context);
       }

    }else if (code == "failed"){
      setDialog1(context);
    }
    else {

    }

  }


  InputDecoration myInputDecoration({String? label, IconData? icon}){
    return InputDecoration(
      hintText: label, //show label as placeholder
      hintStyle: TextStyle(color:Colors.black26, fontSize:14), //hint text style
      prefixIcon: Padding(
          padding: EdgeInsets.only(left:20, right:10),
          child:Icon(icon, color: Colors.black,)
        //padding and icon for prefix
      ),

      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:Colors.black38, width: 1)
      ), //default border of input

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:Colors.black38, width: 1)
      ), //focus border

      fillColor: Color.fromRGBO(255,255,255, 1),
      filled: true, //set true if you want to show input background
    );
  }


  void moveTo() {

  }




}

