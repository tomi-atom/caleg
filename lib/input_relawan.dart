import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
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


  late String nik;
  late String nama;
  late String tempatLahir;
  late String golDarah;
  late String tglLahir;
  late String jenisKelamin;
  late String alamat;
  late String rt;
  late String rw;
  late String kelurahan;
  late String kecamatan;
  late String agama;
  late String statusPerkawinan;
  late String pekerjaan;
  late String kewarganegaraan;
  late String berlakuHingga;
  late String provinsi;
  late String kabKot;

  var _nik = TextEditingController();
  var _password = TextEditingController();

  final TextEditingController tecNik = TextEditingController();
  final TextEditingController tecNama = TextEditingController();
  final TextEditingController tecDate = TextEditingController();
  final TextEditingController tecTempalLahir = TextEditingController();
  final TextEditingController tecKelamin = TextEditingController();
  final TextEditingController tecAlamat = TextEditingController();
  final TextEditingController tecAgama = TextEditingController();
  final TextEditingController tecPerkawinan = TextEditingController();
  final TextEditingController tecPekerjaan = TextEditingController();
  final TextEditingController tecKewarganegaraan = TextEditingController();

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
    errormsg = "";
    error = false;
    showprogress = false;


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

      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Ktp data: ${result?.ktp?.nama}'),
              ElevatedButton(onPressed: scanKtp, child: const Text('PUSH HERE')),
              const SizedBox(height: 8),
              Text(
                "Profile Image",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: tecNik,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'NIK',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
              TextFormField(
                controller: tecNama,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),

              TextFormField(
                controller: tecKelamin,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
              TextFormField(
                controller: tecAlamat,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
              TextFormField(
                controller: tecAgama,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Agama',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
              TextFormField(
                controller: tecPerkawinan,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Status Perkawinan',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
              TextFormField(
                controller: tecPekerjaan,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Pekerjaan',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
              TextFormField(
                controller: tecKewarganegaraan,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Kewarganegaraan',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),

            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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

