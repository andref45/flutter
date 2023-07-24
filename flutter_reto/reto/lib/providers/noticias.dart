import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/noticias_model.dart';

class NoticiasProvider {
  get noticias => null;

  // Función que retorna el listado de películas del cine foro
  Future<List<NoticiasModel>> fetchNoticias() async {
    final response = await http
        .get(Uri.parse('https://appmovil.utpl.edu.ec:8080/v1/news/all?page=1'));

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
