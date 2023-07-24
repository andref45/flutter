import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 0, 0, 0),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/practicas-image.png'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contador');
                    },
                    icon: const Icon(Icons.alarm_add_rounded),
                    label: const Text("Ir contador"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/carnet_page');
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.assignment_ind_outlined),
                        SizedBox(width: 10),
                        Text("Ir a Carnet"),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/noticias_page');
                    },
                    icon: const Icon(Icons.newspaper_sharp),
                    label: const Text("Noticias"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cine_foro_page');
                    },
                    icon: const Icon(Icons.movie),
                    label: const Text("Cine foro"),
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
