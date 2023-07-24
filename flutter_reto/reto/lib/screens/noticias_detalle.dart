import 'package:flutter/material.dart';
import '../models/noticias_model.dart';

class NoticiasDetallesPage extends StatelessWidget {
  final NoticiasModel noticia;

  const NoticiasDetallesPage(this.noticia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Container(
              // Utiliza el Container como fondo de la imagen
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(noticia.image.url),
                  fit: BoxFit.cover,
                ),
              ),
              height: 200,
              width: double.infinity,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 225),
                Text(
                  noticia.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  noticia.description,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
