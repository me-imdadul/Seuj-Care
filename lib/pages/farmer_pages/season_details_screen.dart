import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/crop_model.dart';
import 'package:seujcare/models/season_model.dart';
import 'package:seujcare/providers/crop_provider.dart';

class SeasonsInformationScreen extends StatelessWidget {
  const SeasonsInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CropProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Season Details'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: provider.seasons.isEmpty
            ? Center(
                child: Text('No Data Found'),
              )
            : Column(
                children: List.generate(
                provider.crops.length,
                (index) => seasonListCard(provider.seasons[index]),
              )),
      ),
    );
  }

  Container seasonListCard(SeasonModel season) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                spreadRadius: 3,
                offset: Offset(3, 3))
          ]),
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
                season.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  "https://cdn.britannica.com/16/187216-050-CB57A09B/tomatoes-tomato-plant-Fruit-vegetable.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Season Name and Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              season.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Explore the summer season, its duration, crops, diseases, and environmental requirements.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green.shade700,
              ),
            ),
          ),
          SizedBox(height: 16),

          // Duration Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: buildCardWithIcon(
              icon: Icons.calendar_today,
              title: 'Duration',
              subtitle: 'March to June (Approx. 3-4 months)',
              backgroundColor: Colors.green.shade100,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildCardWithIcon({
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

  Widget buildCardWithImage({
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
