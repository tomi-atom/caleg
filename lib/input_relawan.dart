import 'dart:convert';

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


class InputRelawan extends StatefulWidget {
  @override
  _InputRelawanState createState() => _InputRelawanState();
}

class _InputRelawanState extends State<InputRelawan> {
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


 var tecNik = TextEditingController();
 var tecNama = TextEditingController();
 var tecTempalLahir = TextEditingController();
 var tecDate = TextEditingController();
 var tecAlamat = TextEditingController();
 var tecHp = TextEditingController();
 var tecKelamin = TextEditingController();
 var tecKecamatan = TextEditingController();
 var tecKelurahan = TextEditingController();
 var tecRT = TextEditingController();
 var tecRW = TextEditingController();
  late String username ;
  late String id_karyawan;
  late String nama_karyawan ;
  late String jabatan;


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
    errormsg = "";
    error = false;
    showprogress = false;

    nik = "";
    nama= "";
    tempatLahir = "";
    tglLahir = "";
    jenisKelamin = "";
    alamat = "";
    hp = "";
    rt = "";
    rw = "";
    kelurahan = "";
    kecamatan = "";
    username = "";
    id_karyawan = "";
    nama_karyawan = "";
    jabatan = "";

    getDataUser();

    //_username.text = "defaulttext";
    //_tinggi.text = "defaulttinggi";
    super.initState();
  }
  getDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username')!;
      id_karyawan = prefs.getString('id_karyawam')!;
      nama_karyawan = prefs.getString('nama_karyawan')!;
      jabatan = prefs.getString('jabatan')!;

    });

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      //color set to transperent or set your own color
    ));
    // Obtain shared preferences.


    if(result != null) {
      tecNik.text = '${result?.ktp?.nik}';
      tecNama.text = '${result?.ktp?.nama}';
      tecTempalLahir.text = '${result?.ktp?.tempatLahir}';
      tecDate.text = '${result?.ktp?.tglLahir}';
      tecAlamat.text = '${result?.ktp?.alamat}';
      tecKelamin.text = '${result?.ktp?.jenisKelamin}';
      tecKecamatan.text = '${result?.ktp?.kecamatan}';
      tecKelurahan.text = '${result?.ktp?.kelurahan}';
      tecRT.text = '${result?.ktp?.rt}';
      tecRW.text = '${result?.ktp?.rw}';

    }

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
              ElevatedButton(onPressed: scanKtp, child: const Text('Foto KTP')),
              const SizedBox(height: 8),
              Text(
                "Foto KTPA",
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
                    child: Icon(
                      Icons.person,
                      size: 80,
                    ),
                  ),
                ],
              ),
              ElevatedButton(onPressed: _imgCmr, child: const Text('Foto ')),
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
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              TextFormField(
                controller: tecNama,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),

              TextFormField(
                controller: tecTempalLahir,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'TempatLahir',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),

              Container(
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                margin: EdgeInsets.only(top:10),
                child: TextField(
                  controller: tecDate, //set username controller
                  style:TextStyle(color:Colors.black, fontSize:12),
                  decoration: myInputDecoration(
                    label: "Tanggal Lahir",
                    icon: Icons.date_range,
                  ),
                  readOnly: true,

                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        tecDate.text = formattedDate; //set output date to TextField value.
                      });
                    }else{
                      print("Tanggal Belum di Input");
                    }
                  },

                ),
              ),
              TextFormField(
                controller: tecKelamin,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              TextFormField(
                controller: tecAlamat,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              TextFormField(
                controller: tecHp,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'No HP',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              TextFormField(
                controller: tecKelamin,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              TextFormField(
                controller: tecKecamatan,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Kecamatan',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              TextFormField(
                controller: tecRT,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'RT',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              TextFormField(
                controller: tecRW,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'RW',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              TextFormField(
                controller: tecRW,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'TPS',
                  labelStyle: TextStyle(color: Colors.black87),
                ),

              ),
              Column(

                children: [

                  ElevatedButton(

                    style: ElevatedButton.styleFrom(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        nik = tecNik.text;
                        nama = tecNama.text;
                        tempatLahir = tecTempalLahir.text;
                        tglLahir = tecTempalLahir.text;
                        alamat = tecAlamat.text;
                        jenisKelamin = tecKelamin.text;
                        kelurahan = tecKelurahan.text;
                        rt = tecRT.text;
                        rw = tecRW.text;
                        hp = tecHp.text;
                      });
                      startHitung();
                    },
                    child: const Text("Proses Pendaftaran"),
                  ),

                ],
              ),


            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

  setDialog(BuildContext context) {
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

  startHitung() async {

    var response = await http.post(Uri.parse(apiurl), body: {
      'nik': nik,
      'nama': nama,
      'tempatLahir': tempatLahir,
      'tanggalLahir': tglLahir,
      'alamat': alamat,
      'jenisKelamin': jenisKelamin,
      'kelurahan': kelurahan,
      'rt': rt,
      'rw': rw,
      'hp': hp,
      'referensi': username,
      'status': nik,
      'jenis': nik,
      'nama_tps': nik,
    });
    var jsondata = json.decode(response.body);
    var code = jsondata["code"];
    print(jsondata);
    if (code =="berhasil")
    {
       var hasil = jsondata["message"];


    }else if (code == "failed"){
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


