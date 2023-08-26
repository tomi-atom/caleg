import 'dart:convert';

import 'package:caleg/caleg/home_caleg.dart';
import 'package:caleg/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EXE RELAWAN',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'EXE RELAWAN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late String errormsg;
  late bool error, showprogress;
  late String username, password;
  String apiurl = "http://relawan.riaucore.id/app/login.php"; //api url


  var _username = TextEditingController();
  var _password = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  String JK = "LK";
  String CaraUkur = "berbaring";



  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  @override
  void initState() {
    username = "";
    password = "";
    errormsg = "";
    error = false;
    showprogress = false;
    dateinput.text = "";

    //_username.text = "defaulttext";
    //_username.text = "defaultusername";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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

      body: SingleChildScrollView(
          child:Container(
            alignment: Alignment.center,
            child:Column(children:<Widget>[

              Container(
                width: 90,
                height: 90,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                margin: EdgeInsets.only(top:10),
                child: Text("Masukan Username dan Password", style: TextStyle(
                    color:Colors.blue,fontSize: 18, fontWeight: FontWeight.bold
                ),), //title text
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _username, //set username controller
                  style: TextStyle(color:Colors.black, fontSize:18),

                  decoration: myInputDecoration(
                    label: "Username",
                    icon: Icons.people,
                  ),

                  onChanged: (value){
                    // change username text
                    username = value;
                  },

                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _password, //set password controller
                  style: TextStyle(color:Colors.black, fontSize:18),

                  decoration: myInputDecoration(
                    label: "Password",
                    icon: Icons.lock,
                  ),

                  onChanged: (value){
                    // change password text
                    password = value;
                  },

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
                      startHitung();
                    },
                    child: const Text("Login"),
                  ),

                ],
              ),

            ]),
          )

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  startHitung() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeCaleg()),
    );
     var response = await http.post(Uri.parse(apiurl), body: {
      'username': username,
      'password': password,
    });
    var jsondata = json.decode(response.body);
    var code = jsondata["code"];
    var usernames = jsondata["username"];
    var nama_karyawan = jsondata["nama_karyawan"];
    var id_karyawan = jsondata["id_karyawan"];
    var jabatan = jsondata["jabatan"];
    print(jsondata);

    if(code == "berhasil"){
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Save an integer value to 'counter' key.
      await prefs.setString('username', usernames);
      await prefs.setString('nama_karyawan', nama_karyawan);
      await prefs.setString('id_karyawan', id_karyawan);
      await prefs.setString('jabatan', jabatan);
    }
    if (jabatan =="RELAWAN")
    {

      var hasil = jsondata["message"];
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );

    }else if (jabatan =="SUPER ADMIN"){

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeCaleg()),
      );
    }
    else {
  setDialog1(context);
    }

  }

  setDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          content: const Text('Username Atau Password Salah'),

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



  myInputDecoration({required String label, required IconData icon}) {
    return InputDecoration(
      hintText: label, //show label as placeholder
      hintStyle: TextStyle(color:Colors.black26, fontSize:18), //hint text style
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
}
