import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/crop_disease_model.dart';
import 'package:seujcare/providers/crop_provider.dart';

import 'package:seujcare/utils/constants.dart';

class AddCategoriesScreen extends StatefulWidget {
  const AddCategoriesScreen({super.key});

  @override
  State<AddCategoriesScreen> createState() => _AddCategoriesScreenState();
}

class _AddCategoriesScreenState extends State<AddCategoriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  final name = TextEditingController();
  final symptom = TextEditingController();
  final disease = TextEditingController();
  final season = TextEditingController();
  final condition = TextEditingController();
  final stage = TextEditingController();
  final image = TextEditingController();
  final information = TextEditingController();
  final treatment = TextEditingController();
  final fertilizer = TextEditingController();

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  void clearFields() {
    name.clear();
    symptom.clear();
    disease.clear();
    season.clear();
    condition.clear();
    stage.clear();
    image.clear();
    information.clear();
    treatment.clear();
    fertilizer.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: kbgColor,
      ),
      backgroundColor: kbgColor,
      body: Column(
        children: [
          TabBar(
              controller: controller,
              onTap: (value) {
                setState(() {
                  controller.animateTo(value);
                });
              },
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: 'Category List',
                ),
                Tab(
                  text: 'Add new Category',
                ),
              ]),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                _buildCategoryList(context),
                _buildAddCategory(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildCategoryList(BuildContext context) {
    var provider = Provider.of<CropProvider>(context);
    return provider.cropDiseases.isEmpty
        ? const Center(
            child: Text('No Category Found!'),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ...List.generate(
                    provider.cropDiseases.length,
                    (index) => Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                provider.cropDiseases[index].diseaseImage
                                        .isNotEmpty
                                    ? provider
                                        .cropDiseases[index].diseaseImage[0]
                                    : '',
                                height: 140,
                                width: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                      height: 140,
                                      width: 100,
                                      fit: BoxFit.cover,
                                      'assets/tomatoe.webp');
                                },
                              ),
                            ),
                            const Gap(20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.cropDiseases[index].name,
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Gap(4),
                                  Text(
                                    provider.cropDiseases[index].information,
                                    style: const TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                var response = await Provider.of<CropProvider>(
                                        context,
                                        listen: false)
                                    .deletecropDiseaseCategory(index);
                                print(response);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  _buildAddCategory(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Crop Name'),
            TextField(
              controller: name,
            ),
            const Text('Symptoms'),
            TextField(
              controller: symptom,
            ),
            const Text('Disease Name'),
            TextField(
              controller: disease,
            ),
            const Text('Season'),
            TextField(
              controller: season,
            ),
            const Text('Condition'),
            TextField(
              controller: condition,
            ),
            const Text('Stage'),
            TextField(
              controller: stage,
            ),
            const Text('Images'),
            TextField(
              controller: image,
            ),
            const Text('Information'),
            TextField(
              controller: information,
            ),
            const Text('Treatment'),
            TextField(
              controller: treatment,
            ),
            const Text('Suggested Fertilizer'),
            TextField(
              controller: fertilizer,
            ),
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.green,
              onPressed: () async {
                var cropDiseaseModel = CropDiseaseModel(
                    id: DateTime.now().toString(),
                    name: name.text,
                    season: season.text,
                    symptoms: symptom.text,
                    diseaseName: disease.text,
                    condition: condition.text,
                    stage: stage.text,
                    diseaseImage: [image.text],
                    information: information.text,
                    treatment: treatment.text,
                    suggestedFertilizer: ["Fertilizer 1"]);
                log(cropDiseaseModel.toMap().toString());
                var response =
                    await Provider.of<CropProvider>(context, listen: false)
                        .addCropDiseaseCategory(cropDiseaseModel);

                log(response.toString());
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
