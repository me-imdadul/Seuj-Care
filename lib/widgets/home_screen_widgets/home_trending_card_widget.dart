import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final VoidCallback onTap;
  const TrendingCard({super.key, required this.index, required this.onTap});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 15, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(2, 4))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
                height: 120,
                width: 200,
                fit: BoxFit.cover,
                "https://www.macspharmacy.com/wp-content/uploads/2019/08/vegetables.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Crop $index",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "Description $index",
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
