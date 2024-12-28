import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/crop_model.dart';
import 'package:seujcare/providers/admin_provider.dart';

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

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<AdminProvider>(context, listen: false).getCropList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AdminProvider>(context, listen: false);
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
                _buildCategoryList(context, provider.crops),
                _buildAddCategory(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildCategoryList(BuildContext context, List<CropModel> lists) {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ...List.generate(
              lists.length,
              (index) => Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'assets/tomatoe.webp',
                          height: 140,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category 1',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Gap(4),
                          Text('Description asidj sdhbds ybhd yhd')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  _buildAddCategory(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Crop Name'),
            TextField(
              controller: name,
            ),
            Text('Symptoms'),
            TextField(
              controller: symptom,
            ),
            Text('Disease Name'),
            TextField(
              controller: disease,
            ),
            Text('Season'),
            TextField(
              controller: season,
            ),
            Text('Condition'),
            TextField(
              controller: condition,
            ),
            Text('Stage'),
            TextField(
              controller: stage,
            ),
            Text('Images'),
            TextField(
              controller: image,
            ),
            Text('Information'),
            TextField(
              controller: information,
            ),
            Text('Treatment'),
            TextField(
              controller: treatment,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('Add'),
            )
          ],
        ),
      ),
    ));
  }
}
