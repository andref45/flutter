import 'package:flutter/material.dart';
import '../models/cine_foro_model.dart';
import '../providers/cine_foro_provider.dart';
import 'cine_foro_detalles.dart';

class CineForoPage extends StatefulWidget {
  const CineForoPage({Key? key}) : super(key: key);

  @override
  State<CineForoPage> createState() => _CineForoPageState();
}

class _CineForoPageState extends State<CineForoPage> {
  late Future<List<NoticiasModel>> _cineForoFuture;

  @override
  void initState() {
    super.initState();
    _cineForoFuture = CineForoProvider().fetchCineForo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado del Cine Foro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<NoticiasModel>>(
        future: _cineForoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error al obtener los datos'),
            );
          } else if (snapshot.hasData) {
            List<NoticiasModel> items = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                childAspectRatio: 1.2, // Ajusta el tamaño de las imágenes
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                NoticiasModel item = items[index];
                return GestureDetector(
                  onTap: () {
                    // Navegar a la pantalla de detalles de la película al tocar la tarjeta
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PeliculaDetallesPage(item),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            item.image.url,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No se encontraron datos'),
            );
          }
        },
      ),
    );
  }
}
