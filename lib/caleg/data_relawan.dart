
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:mnc_identifier_ocr/mnc_identifier_ocr.dart';
import 'package:mnc_identifier_ocr/model/ocr_result_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



class DataRelawan extends StatefulWidget {
  @override
  _DataRelawanState createState() => _DataRelawanState();
}

class _DataRelawanState extends State<DataRelawan> {

  late String errormsg;
  late bool error, showprogress;
  String apiurl = "http://relawan.riaucore.id/app/inputpelaporan.php"; //api url

  late String nik;
  late String nama;
  late String tempatLahir;
  late String tglLahir;
  late String jenisKelamin;
  late String alamat;
  late String hp;
  late String rt;
  late String rw;
  late String kelurahan;
  late String kecamatan;
  late String username ;
  late String id_karyawan;
  late String nama_karyawan ;
  late String jabatan;


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

