import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddCropScreen extends StatefulWidget {
  const AddCropScreen({super.key});

  @override
  State<AddCropScreen> createState() => _AddCropScreenState();
}

class _AddCropScreenState extends State<AddCropScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add crop Details'),
      ),
      body: Column(
        children: [Gap(20), Text('')],
      ),
    );
  }
}
