import 'package:flutter/material.dart';

class CropDiseaseDetailsPage extends StatelessWidget {
  const CropDiseaseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade800,
        title: const Text("Disease Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 55, 138, 58),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/tomatoe.webp',
                      ),
                    ),
                    Text(
                      "Tomato",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4.0,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Disease: Late Blight",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Description:",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "Late blight is a fungal disease that causes significant damage to tomato plants, leading to dark lesions on leaves and stems.",
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Condition:",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text("Occurs in humid and wet weather conditions."),
                      SizedBox(height: 10.0),
                      Text(
                        "Season:",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text("Common during the rainy season."),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Solution:",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4.0,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Use fungicides like chlorothalonil or copper-based sprays. Ensure proper air circulation and avoid overhead watering.",
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Similar Crops:",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              const SizedBox(height: 10.0),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CropCard(cropName: "Potato"),
                    CropCard(cropName: "Eggplant"),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Similar Diseases:",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              const SizedBox(height: 10.0),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DiseaseCard(diseaseName: "Early Blight"),
                    DiseaseCard(diseaseName: "Anthracnose"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CropCard extends StatelessWidget {
  final String cropName;

  const CropCard({super.key, required this.cropName});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.only(right: 10.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 120.0,
        child: Center(
          child: Text(
            cropName,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class DiseaseCard extends StatelessWidget {
  final String diseaseName;

  const DiseaseCard({super.key, required this.diseaseName});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.only(right: 10.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 120.0,
        child: Center(
          child: Text(
            diseaseName,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
