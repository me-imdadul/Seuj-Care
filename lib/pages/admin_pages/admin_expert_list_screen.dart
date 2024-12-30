import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/expert_model.dart';
import 'package:seujcare/pages/expert_pages/expert_profile_page.dart';
import 'package:seujcare/providers/admin_provider.dart';
import 'package:seujcare/services/auth_service.dart';
import 'package:seujcare/utils/commons.dart';
import 'package:seujcare/utils/constants.dart';
import 'package:seujcare/widgets/admin/expert_list_card.dart';

class AdminExpertScreen extends StatefulWidget {
  const AdminExpertScreen({super.key});

  @override
  State<AdminExpertScreen> createState() => _AdminExpertScreenState();
}

class _AdminExpertScreenState extends State<AdminExpertScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AdminProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: kbgColor,
        backgroundColor: kbgColor,
        title: const Text('All Experts'),
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
            if (provider.experts.length == 0)
              Center(child: Text('No Expert Found'))
            else
              ...List.generate(
                provider.experts.length,
                (index) {
                  return FadeInUp(
                      delay: const Duration(milliseconds: 50),
                      child: ExpertListCard(
                        expertModel: provider.experts[index],
                        onTap: () async {
                          print(await AuthenticationServices().session);
                          navigateToScreen(
                              context,
                              ExpertProfile(
                                isAdmin: true,
                              ));
                        },
                      ));
                },
              )
          ],
        ),
      ),
    );
  }
}
