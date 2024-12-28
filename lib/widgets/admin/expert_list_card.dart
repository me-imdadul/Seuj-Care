import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seujcare/models/expert_model.dart';

class ExpertListCard extends StatelessWidget {
  final ExpertModel expertModel;
  final VoidCallback onTap;
  const ExpertListCard(
      {super.key, required this.expertModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Image.network(
              height: 55,
              width: 55,
              expertModel.profileImg,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(Iconsax.user, color: Colors.green.shade700),
                ),
              ),
            ),
            const Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expertModel.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Gap(5),
                Row(
                  children: [
                    ...List.generate(
                      expertModel.specializations.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                            color: Colors.yellow.withAlpha(40),
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          expertModel.specializations[index],
                          style: TextStyle(
                              fontSize: 11, color: Colors.yellow.shade900),
                        ),
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
      ),
    );
  }
}
