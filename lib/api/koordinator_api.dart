import 'dart:convert';

import 'package:caleg/model/koordinator.dart';
import 'package:http/http.dart' as http;

import '../model/book.dart';

class KoordinatorsApi {
  static Future<List<Koordinator>> getKoordinators(String query) async {
    final url = Uri.parse(
        'https://relawan.riaucore.id/app/data_koordinator.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List koordinators = json.decode(response.body);

      return koordinators.map((json) => Koordinator.fromJson(json)).where((koordinator) {
        final titleLower = koordinator.username.toLowerCase();
        final authorLower = koordinator.jabatan.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
