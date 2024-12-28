import 'package:flutter/material.dart';

class SeasonsInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Season Details'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Season Header with Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://cdn.britannica.com/16/187216-050-CB57A09B/tomatoes-tomato-plant-Fruit-vegetable.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Season Name and Description
            Text(
              'Summer Season',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Explore the summer season, its duration, crops, diseases, and environmental requirements.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green.shade700,
              ),
            ),
            SizedBox(height: 16),

            // Duration Card
            buildCardWithIcon(
              context,
              icon: Icons.calendar_today,
              title: 'Duration',
              subtitle: 'March to June (Approx. 3-4 months)',
              backgroundColor: Colors.green.shade100,
            ),
            SizedBox(height: 16),

            // Good for Growing Crops
            buildCardWithImage(
              context,
              title: 'Good for Growing Crops',
              imageUrl:
                  'https://cdn.britannica.com/16/187216-050-CB57A09B/tomatoes-tomato-plant-Fruit-vegetable.jpg',
              description: 'Tomato, Corn, Cotton, Chili, Soybean',
            ),
            SizedBox(height: 16),

            // Suitable for Harvesting Crops
            buildCardWithImage(
              context,
              title: 'Suitable for Harvesting Crops',
              imageUrl:
                  'https://cdn.britannica.com/16/187216-050-CB57A09B/tomatoes-tomato-plant-Fruit-vegetable.jpg',
              description: 'Wheat, Barley, Mustard',
            ),
            SizedBox(height: 16),

            // Diseases that Can Affect
            buildCardWithImage(
              context,
              title: 'Diseases that Can Affect',
              imageUrl:
                  'https://cdn.britannica.com/16/187216-050-CB57A09B/tomatoes-tomato-plant-Fruit-vegetable.jpg',
              description: 'Powdery Mildew, Bacterial Blight, Aphids, Thrips',
            ),
            SizedBox(height: 16),

            // Humidity Requirements
            buildCardWithIcon(
              context,
              icon: Icons.water_drop,
              title: 'Humidity Requirements',
              subtitle: '30% to 60% (Varies by Crop)',
              backgroundColor: Colors.blue.shade100,
            ),
            SizedBox(height: 16),

            // Sunlight Requirements
            buildCardWithIcon(
              context,
              icon: Icons.wb_sunny,
              title: 'Sunlight Requirements',
              subtitle: '6-8 hours of direct sunlight daily',
              backgroundColor: Colors.yellow.shade100,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardWithIcon(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color backgroundColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
        ),
        child: ListTile(
          leading: Icon(
            icon,
            size: 40,
            color: Colors.green.shade700,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.green.shade700,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardWithImage(
    BuildContext context, {
    required String title,
    required String imageUrl,
    required String description,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
