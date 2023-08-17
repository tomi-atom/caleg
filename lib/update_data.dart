
import 'package:flutter/material.dart';


class Rekomendasi extends StatefulWidget {
  @override
  _RekomendasiState createState() => _RekomendasiState();
}

class _RekomendasiState extends State<Rekomendasi> {

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
              get1(),
              get2(),
              get3(),
              get4(),
              get5()

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
            child: Image.asset('assets/images/logo.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Text(
                  'Stunting Calculator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arizonia',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 0.27,
                  ),
                ),
                Text(
                  'Dr. Aslis Wirda Hayati, SP, M.Si',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontFamily: 'Arizonia',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,

                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget get1() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),

      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/images/woman1.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'PADA IBU HAMIL',
                  textAlign: TextAlign.left,
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                  ),
                ),
                Text(
                  'Memperbaiki gizi dan menjaga kesehatan Ibu hamil merupakan cara terbaik dalam mengatasi stunting. Setiap ibu hamil perlu mendapat tablet tambah darah, minimal 90 tablet selama kehamilan.',
                  textAlign: TextAlign.left,

                  style: TextStyle(

                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,

                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget get2() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),

      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/images/woman2.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'PADA SAAT BAYI LAHIR',
                  textAlign: TextAlign.left,
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                  ),
                ),
                Text(
                  'Ketika bayi lahir segera dilakukan Inisiasi Menyusu Dini (IMD) dan diberi Air Susu Ibu (ASI) saja (ASI Eksklusif) sampai dengan usia 6 bulan',
                  textAlign: TextAlign.left,

                  style: TextStyle(

                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,

                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget get3() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),

      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/images/woman3.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'BAYI BERUSIA 6 BULAN-2 TAHUN',
                  textAlign: TextAlign.left,
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                  ),
                ),
                Text(
                  'Pemberian ASI terus dilakukan sampai bayi berumur 2 tahun dan diberi Makanan Pendamping ASI (MP-ASI) serta memperoleh kapsul vitamin A dan imunisasi dasar lengkap',
                  textAlign: TextAlign.left,

                  style: TextStyle(

                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,

                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget get4() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),

      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/images/woman4.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'BALITA',
                  textAlign: TextAlign.left,
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                  ),
                ),
                Text(
                  'Memantau pertumbuhan Balita di posyandu merupakan upaya yang sangat strategis untuk mendeteksi dini terjadinya gangguan pertumbuhan',
                  textAlign: TextAlign.left,

                  style: TextStyle(

                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,

                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget get5() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),

      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/images/woman5.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'PERILAKU HIDUP BERSIH DAN SEHAT (PHBS) HARUS DIUPAYAKAN OLEH SETIAP RUMAH TANGGA',
                  textAlign: TextAlign.left,
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                  ),
                ),
                Text(
                  'PHBS menurunkan kejadian sakit terutama penyakit infeksi yang dapat membuat energi untuk pertumbuhan teralihkan kepada perlawanan tubuh menghadapi infeksi, gizi sulit diserap oleh tubuh dan terhambatnya pertumbuhan',
                  textAlign: TextAlign.left,

                  style: TextStyle(

                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,

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

