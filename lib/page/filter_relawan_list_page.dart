import 'dart:async';

import 'package:caleg/main.dart';
import 'package:caleg/model/relawan.dart';
import 'package:caleg/widget/search_widget.dart';
import 'package:flutter/material.dart';

import '../api/relawan_api.dart';

class FilterRelawanListPage extends StatefulWidget {
  @override
  FilterRelawanListPageState createState() => FilterRelawanListPageState();
}

class FilterRelawanListPageState extends State<FilterRelawanListPage> {
  List<Relawan> relawans = [];
  String query = '';
  Timer? debouncer;

  String url = 'https://relawan.riaucore.id/foto/';

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final relawans = await RelawansApi.getRelawans(query);

    setState(() => this.relawans = relawans);
  }

  @override
  Widget build(BuildContext context) => Scaffold(

        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: relawans.length,
                itemBuilder: (context, index) {
                  final relawan = relawans[index];

                  return buildRelawan(relawan);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Nama',
        onChanged: searchRelawan,
      );

  Future searchRelawan(String query) async => debounce(() async {
        final relawans = await RelawansApi.getRelawans(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.relawans = relawans;
        });
      });

  Widget buildRelawan(Relawan relawan) => ListTile(

        leading: Image.network(
          url + relawan.foto,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(relawan.nama),
        subtitle: Text(relawan.noKtp),
      );
}
