import 'package:flutter/material.dart';

class CarnetPage extends StatelessWidget {
  const CarnetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> carnetData = {
      "name": "John Jairo Villavicencio Sarango",
      "identification": "1234567890",
      "charge": "Analista de negocios",
      "modality": "Presencial",
      "specialty": "Sistemas Informáticos y Computación",
      "photo": "assets/images/profile-avatar.png",
      "qr": "assets/images/carnet-qr.png",
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Carnet Digital',
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/carnet-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      carnetData["qr"]!,
                      width: 180,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextItem(
                  text: carnetData["name"]!.toUpperCase(),
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                TextItem(
                  text: 'C.I.: ${carnetData["identification"]!}',
                  fontSize: 20,
                ),
                const SizedBox(height: 10),
                AcademicInfo(carnetData: carnetData),
                const SizedBox(height: 10),
                TextItem(
                  text: carnetData["specialty"]!,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                ClipOval(
                  child: Image.asset(
                    carnetData["photo"]!,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 25),
                const TextItem(
                  text: "UTPL",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AcademicInfo extends StatelessWidget {
  const AcademicInfo({
    super.key,
    required this.carnetData,
  });

  final Map<String, String> carnetData;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF0F537A);

    return SizedBox(
      width: 250,
      child: Row(
        children: [
          Expanded(
            child: Text(
              carnetData["charge"]!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: color,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          // Vertical line separator
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 25,
            width: 3,
            color: color,
          ),
          Expanded(
            child: Text(
              carnetData["modality"]!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: color,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

class TextItem extends StatelessWidget {
  const TextItem({
    super.key,
    required this.text,
    this.fontSize = 23,
    this.fontWeight = FontWeight.w500,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: const Color(0xFF0F537A),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
