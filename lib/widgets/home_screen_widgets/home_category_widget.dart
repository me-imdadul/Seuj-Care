import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(2, 4))
                ],
                image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.cover)),
          ),
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
