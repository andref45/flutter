import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/marvel_model.dart';

class MarvelProvider {
  static const String baseUrl =
      "https://gateway.marvel.com:443/v1/public/characters";
  static const String apiKey = "19e42c2524705288f1263621cf8be5f6";

  Future<List<MarvelModel>> fetchMarvel() async {
    final response = await http.get(Uri.parse('$baseUrl?apikey=$apiKey'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['data']['results'];
      return List<MarvelModel>.from(
          data.map((item) => MarvelModel.fromJson(item)));
    } else {
      return [];
    }
  }
}
