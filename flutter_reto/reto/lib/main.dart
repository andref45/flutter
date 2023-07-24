import 'package:flutter/material.dart';

import 'package:reto/screens/carnet_page.dart';
import 'package:reto/screens/cine_foro_page.dart';
import 'package:reto/screens/counter_page.dart';
import 'package:reto/screens/menu_page.dart';
import 'package:reto/screens/noticias_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
      routes: {
        '/contador': (BuildContext context) => const CounterPage(),
        '/carnet_page': (BuildContext context) => const CarnetPage(),
        '/noticias_page': (BuildContext context) => const NoticiasPage(),
        '/cine_foro_page': (BuildContext context) => const CineForoPage(),
      },
    );
  }
}
