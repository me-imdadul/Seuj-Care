import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seujcare/models/crop_disease_model.dart';

class TrendingCard extends StatelessWidget {
  final VoidCallback onTap;
  final CropDiseaseModel cropDisease;
  const TrendingCard(
      {super.key,
      required this.index,
      required this.onTap,
      required this.cropDisease});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 15, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(2, 4))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              cropDisease.diseaseImage[0],
              errorBuilder: (context, error, stackTrace) => SizedBox(
                  height: 120,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.image4),
                        Gap(5),
                        Text('Loading failed'),
                      ],
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cropDisease.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  cropDisease.information,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
