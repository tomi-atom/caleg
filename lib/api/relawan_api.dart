import 'dart:convert';

import 'package:caleg/api/base_api.dart';
import 'package:caleg/model/relawan.dart';
import 'package:http/http.dart' as http;

import '../model/book.dart';

class RelawansApi {
  static Future<List<Relawan>> getRelawans(String query) async {
    final url = Uri.parse(Apis.dataRelawanApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List relawans = json.decode(response.body);

      return relawans.map((json) => Relawan.fromJson(json)).where((relawan) {
        final titleLower = relawan.nama.toLowerCase();
        final authorLower = relawan.noKtp.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
