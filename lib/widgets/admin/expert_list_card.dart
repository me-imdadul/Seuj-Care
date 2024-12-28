import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ExpertListCard extends StatelessWidget {
  const ExpertListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(100),
            ),
            child:
                Center(child: Icon(Iconsax.user, color: Colors.green.shade700)),
          ),
          const Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Expert name 1',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Gap(5),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                        color: Colors.yellow.withAlpha(40),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'Pest Control',
                      style: TextStyle(
                          fontSize: 11, color: Colors.yellow.shade900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                        color: Colors.yellow.withAlpha(40),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'Pest Control',
                      style: TextStyle(
                          fontSize: 11, color: Colors.yellow.shade900),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          const Icon(Iconsax.arrow_right_3)
        ],
      ),
    );
  }
}
