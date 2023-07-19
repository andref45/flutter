import 'package:flutter/material.dart';
import '../models/marvel_model.dart';
import '../providers/marvel_provider.dart';

class MarvelPage extends StatefulWidget {
  const MarvelPage({Key? key}) : super(key: key);

  @override
  State<MarvelPage> createState() => _MarvelPageState();
}

class _MarvelPageState extends State<MarvelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado de Personajes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<MarvelModel>>(
        future: MarvelProvider().fetchMarvel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al obtener los datos: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<MarvelModel> items = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.7,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                MarvelModel item = items[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(item.thumbnailUrl),
                      ),
                      Text(
                        item.name.toUpperCase(),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No hay datos disponibles.'),
            );
          }
        },
      ),
    );
  }
}
