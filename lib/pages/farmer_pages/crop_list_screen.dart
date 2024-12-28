import 'package:flutter/material.dart';

class CropListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade800,
        title: Text("Crops"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CropCard(
              cropName: "Tomato",
              imageUrl:
                  "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg",
              season: "Summer",
              description:
                  "Grows well in warm climates. Harvest within 70-80 days.",
            ),
            CropCard(
              cropName: "Wheat",
              imageUrl:
                  "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg",
              season: "Winter",
              description: "Thrives in cool weather. Harvest in 120 days.",
            ),
            CropCard(
              cropName: "Rice",
              imageUrl:
                  "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg",
              season: "Monsoon",
              description: "Requires plenty of water. Harvest after 150 days.",
            ),
            CropCard(
              cropName: "Corn",
              imageUrl:
                  "https://www.fitterfly.com/blog/wp-content/uploads/2024/07/Is-Onion-Good-for-Diabetes-Types-Benefits-Side-Effects-and-More.webp",
              season: "Spring",
              description: "Ideal for spring planting. Harvest after 90 days.",
            ),
            CropCard(
              cropName: "Potato",
              imageUrl:
                  "https://www.fitterfly.com/blog/wp-content/uploads/2024/07/Is-Onion-Good-for-Diabetes-Types-Benefits-Side-Effects-and-More.webp",
              season: "Winter",
              description: "Best in cold climates. Harvest in 100 days.",
            ),
            CropCard(
              cropName: "Onion",
              imageUrl:
                  "https://www.fitterfly.com/blog/wp-content/uploads/2024/07/Is-Onion-Good-for-Diabetes-Types-Benefits-Side-Effects-and-More.webp",
              season: "Winter",
              description: "Thrives in moderate weather. Harvest in 110 days.",
            ),
            CropCard(
              cropName: "Soybean",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Vehn%C3%A4pelto_6.jpg/330px-Vehn%C3%A4pelto_6.jpg",
              season: "Summer",
              description: "Requires hot climate. Harvest in 120 days.",
            ),
            CropCard(
              cropName: "Cotton",
              imageUrl:
                  "https://www.fitterfly.com/blog/wp-content/uploads/2024/07/Is-Onion-Good-for-Diabetes-Types-Benefits-Side-Effects-and-More.webp",
              season: "Summer",
              description: "Prefers warm weather. Harvest in 160 days.",
            ),
            CropCard(
              cropName: "Sugarcane",
              imageUrl:
                  "https://www.fitterfly.com/blog/wp-content/uploads/2024/07/Is-Onion-Good-for-Diabetes-Types-Benefits-Side-Effects-and-More.webp",
              season: "Year-round",
              description: "Long growth cycle. Harvest in 12 months.",
            ),
            CropCard(
              cropName: "Barley",
              imageUrl:
                  "https://www.fitterfly.com/blog/wp-content/uploads/2024/07/Is-Onion-Good-for-Diabetes-Types-Benefits-Side-Effects-and-More.webp",
              season: "Winter",
              description: "Grows in cool climates. Harvest in 90 days.",
            ),
            CropCard(
              cropName: "Peas",
              imageUrl:
                  "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg",
              season: "Spring",
              description: "Perfect for spring planting. Harvest in 60 days.",
            ),
            CropCard(
              cropName: "Mango",
              imageUrl:
                  "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg",
              season: "Summer",
              description:
                  "Requires tropical climate. Harvest after flowering.",
            ),
            CropCard(
              cropName: "Pineapple",
              imageUrl:
                  "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg",
              season: "Year-round",
              description: "Takes time to grow. Harvest in 18 months.",
            ),
            CropCard(
              cropName: "Chili",
              imageUrl:
                  "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg",
              season: "Summer",
              description: "Prefers hot climate. Harvest in 100 days.",
            ),
            CropCard(
              cropName: "Carrot",
              imageUrl:
                  "https://www.shutterstock.com/shutterstock/photos/2509533753/display_1500/stock-photo-corn-cobs-in-corn-farming-fields-during-the-harvest-season-can-be-used-for-roasted-corn-or-staple-2509533753.jpg",
              season: "Winter",
              description: "Best grown in cool weather. Harvest in 90 days.",
            ),
          ],
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
