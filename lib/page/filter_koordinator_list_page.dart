import 'dart:async';

import 'package:caleg/main.dart';
import 'package:caleg/model/koordinator.dart';
import 'package:caleg/widget/search_widget.dart';
import 'package:flutter/material.dart';

import '../api/koordinator_api.dart';

class FilterKoordinatorListPage extends StatefulWidget {
  @override
  FilterKoordinatorListPageState createState() => FilterKoordinatorListPageState();
}

class FilterKoordinatorListPageState extends State<FilterKoordinatorListPage> {
  List<Koordinator> koordinators = [];
  String query = '';
  Timer? debouncer;

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
    final koordinators = await KoordinatorsApi.getKoordinators(query);

    setState(() => this.koordinators = koordinators);
  }

  @override
  Widget build(BuildContext context) => Scaffold(

        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: koordinators.length,
                itemBuilder: (context, index) {
                  final koordinator = koordinators[index];

                  return buildKoordinator(koordinator);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Nama',
        onChanged: searchKoordinator,
      );

  Future searchKoordinator(String query) async => debounce(() async {
        final koordinators = await KoordinatorsApi.getKoordinators(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.koordinators = koordinators;
        });
      });

  Widget buildKoordinator(Koordinator koordinator) => ListTile(

        title: Text(koordinator.username),
        subtitle: Text(koordinator.jabatan),
      );
}
