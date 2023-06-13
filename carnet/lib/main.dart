import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(Icons.arrow_back_ios),
              SizedBox(),
              Expanded(
                child: Center(
                  child: Text('Carnet Digital'),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/carnet_background.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 300,
                    child: Image.asset('assets/carnet_qr.png'),
                  ),
                  const Text(
                    'ORLY ANDRÉ\nFLORES VALDIVIEZO',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 34, 80, 159),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '\t         \tC.I.: 1105312423\nESTUDIANTE  \t| COMPUTACIÓN'
                    '\nPRESENCIAL   \t|',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 34, 80, 159),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sistemas informáticos y \n           Computación',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 34, 80, 159),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/profile_avatar.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'UTPL',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 34, 80, 159),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
