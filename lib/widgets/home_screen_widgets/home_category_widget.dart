import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seujcare/pages/farmer_pages/product_screen.dart';

class HomeCategory extends StatelessWidget {
  final String text1;
  final String image;

  final VoidCallback onTap;
  const HomeCategory(
      {super.key,
      required this.text1,
      required this.onTap,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(2, 4))
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Icon(Iconsax.image4),
                    )),
              ),
            ),
          ),
          const Gap(5),
          Text(
            text1,
            style: TextStyle(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
