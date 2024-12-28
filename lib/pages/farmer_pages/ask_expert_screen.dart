import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AskExpertScreen extends StatefulWidget {
  const AskExpertScreen({super.key});

  @override
  State<AskExpertScreen> createState() => _AskExpertScreenState();
}

class _AskExpertScreenState extends State<AskExpertScreen> {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 10),

              Text(
                "Submit your query below and our team will get back to you with personalized advice.",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),

              // Query Form
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
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
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                              value: "Crop Management",
                              child: Text("Crop Management")),
                          DropdownMenuItem(
                              value: "Pest Control",
                              child: Text("Pest Control")),
                          DropdownMenuItem(
                              value: "Soil Analysis",
                              child: Text("Soil Analysis")),
                          DropdownMenuItem(
                              value: "Irrigation", child: Text("Irrigation")),
                        ],
                        onChanged: (value) {
                          // Handle selection
                        },
                        hint: Text("Choose a category"),
                      ),
                      SizedBox(height: 16),

                      // Query Input Field
                      Text(
                        "Your Question",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[800],
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Type your question here...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

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
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade500),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.image,
                                  size: 45,
                                  color: Colors.green,
                                ),
                              ),
                              Gap(10),
                              Text('No file selected.')
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: Text("Upload"))
                        ],
                      ),
                      SizedBox(height: 24),

                      // Submit Button
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            // Handle Submit
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Info Section
              Text(
                "Why ask an expert?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10),
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
