import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/providers/crop_provider.dart';

class CropListScreen extends StatefulWidget {
  const CropListScreen({super.key});

  @override
  State<CropListScreen> createState() => _CropListScreenState();
}

class _CropListScreenState extends State<CropListScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CropProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade800,
        title: const Text("Crops"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: provider.crops.isEmpty
            ? const Center(
                child: Text('No Data Found'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: provider.crops.length,
                itemBuilder: (context, index) {
                  return CropCard(
                    cropName: provider.crops[index].name,
                    imageUrl: provider.crops[index].cropUrl.isEmpty
                        ? "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg"
                        : provider.crops[index].cropUrl,
                    season: provider.crops[index].season,
                    description: provider.crops[index].description,
                  );
                },
              ),
      ),
    );
  }
}

class CropCard extends StatelessWidget {
  final String cropName;
  final String imageUrl;
  final String season;
  final String description;

  CropCard({
    super.key,
    required this.cropName,
    required this.imageUrl,
    required this.season,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                height: 80.0,
                width: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cropName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Season: $season",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey.shade600,
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
