import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AskExpertNewScreen extends StatefulWidget {
  const AskExpertNewScreen({super.key});

  @override
  AskExpertScreenState createState() => AskExpertScreenState();
}

class AskExpertScreenState extends State<AskExpertNewScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _cropDetailsController = TextEditingController();

  File? _image;
  String? _selectedCategory;

  final List<String> categories = [
    'Cereals',
    'Fruits',
    'Vegetables',
    'Spices',
    'Flowers',
    'Oilseeds',
  ];

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask an Expert"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCard(
                title: 'Crop Details',
                child: TextField(
                  controller: _cropDetailsController,
                  decoration: const InputDecoration(
                    labelText: 'Enter crop details',
                    border: OutlineInputBorder(),
                    hintText: 'e.g., wheat, height, etc.',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildCard(
                title: 'Crop Category',
                child: DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  items: categories
                      .map<DropdownMenuItem<String>>((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Select crop category',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildCard(
                title: 'Your Question',
                child: TextField(
                  controller: _questionController,
                  decoration: const InputDecoration(
                    labelText: 'Ask your question',
                    border: OutlineInputBorder(),
                    hintText: 'Describe your issue',
                  ),
                  maxLines: 4,
                ),
              ),
              const SizedBox(height: 16),
              _buildCard(
                title: 'Upload Image of Crop (Optional)',
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Pick Image from Gallery'),
                    ),
                    if (_image != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.file(
                          _image!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission logic
                  print("Form submitted");
                },
                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
