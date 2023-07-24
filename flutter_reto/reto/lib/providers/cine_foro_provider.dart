import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cine_foro_model.dart';

class CineForoProvider {
  // Función que retorna el listado de películas del cine foro
  Future<List<NoticiasModel>> fetchCineForo() async {
    final response = await http.get(Uri.parse(
        'https://appmovil.utpl.edu.ec:8080/v2/library/benjamin/cine/forum/all?page=1'));

    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = json.decode(data);
      List<dynamic> cineForoData = jsonData['data'];
      return cineForoData.map((item) => NoticiasModel.fromJson(item)).toList();
    } else {
      print('Error: ${response.statusCode}');
      return []; // Retorna una lista vacía en caso de error
    }
  }
}
