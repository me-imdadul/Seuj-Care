import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seujcare/utils/constants.dart';
import 'package:seujcare/widgets/admin/expert_list_card.dart';

class FarmerIssueScreen extends StatelessWidget {
  const FarmerIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbgColor,
        title: const Text('Recent Issues'),
      ),
      backgroundColor: kbgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.search_normal,
                      color: Colors.green,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Experts',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w400)),
                      ),
                    )),
                    const Icon(
                      Iconsax.filter,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
            const Gap(10),
            ...List.generate(
              50,
              (index) {
                return FadeInUp(
                    delay: Duration(milliseconds: index * 80),
                    child: GestureDetector(child: const ExpertListCard()));
              },
            )
          ],
        ),
      ),
    );
  }
}
