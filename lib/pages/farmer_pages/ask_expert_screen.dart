import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/query_model.dart';
import 'package:seujcare/providers/query_provider.dart';

class AskExpertScreen extends StatefulWidget {
  const AskExpertScreen({super.key});

  @override
  State<AskExpertScreen> createState() => _AskExpertScreenState();
}

class _AskExpertScreenState extends State<AskExpertScreen> {
  Box _box = Hive.box('myBox');

  final date = TextEditingController();
  final query = TextEditingController();
  final image = TextEditingController();

  String category = '';
  String imagePath = '';
  ImagePicker pick = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QueryProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        title: const Text(
          "Ask an Expert",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Need advice? Ask our agriculture experts!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),

              Text(
                "Submit your query below and our team will get back to you with personalized advice.",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),

              // Query Form
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Dropdown for Categories
                      Text(
                        "Select Category",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        items: [
                          const DropdownMenuItem(
                              value: "Crop Management",
                              child: Text("Crop Management")),
                          const DropdownMenuItem(
                              value: "Pest Control",
                              child: Text("Pest Control")),
                          const DropdownMenuItem(
                              value: "Soil Analysis",
                              child: Text("Soil Analysis")),
                          const DropdownMenuItem(
                              value: "Irrigation", child: Text("Irrigation")),
                        ],
                        onChanged: (value) {
                          category = value ?? "Category";
                        },
                        hint: const Text("Choose a category"),
                      ),
                      const SizedBox(height: 16),

                      // Query Input Field
                      Text(
                        "Your Question",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: query,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Type your question here...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Query Input Field
                      Text(
                        "Upload an Image (Optional)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[800],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade500),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.image,
                                    size: 45,
                                    color: Colors.green,
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Text(
                                    imagePath.isEmpty
                                        ? 'No file selected.'
                                        : imagePath,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      side:
                                          const BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () async {
                                XFile? pickedImage = await pick.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  imagePath = pickedImage!.path;
                                });
                              },
                              child: const Text("Upload"))
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Submit Button
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () async {
                            var session = _box.get('session');
                            var queryData = QueryModel(
                                category: category,
                                image: imagePath,
                                status: '0',
                                query: query.text,
                                assignedTo: '',
                                queryId: DateTime.timestamp().toString(),
                                createdBy: session['email'],
                                timestamp: DateTime.timestamp());
                            print(queryData.toMap().toString());
                            var result = await provider.newQuery(queryData);
                            print(result);
                            if (result == null) {
                              print('added');
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Info Section
              Text(
                "Why ask an expert?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Our experienced agriculture professionals can guide you on crop health, pest management, irrigation techniques, and more to maximize your farm's yield.",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
