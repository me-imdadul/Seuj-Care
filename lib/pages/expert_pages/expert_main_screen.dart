import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seujcare/pages/expert_pages/expert_home_screen.dart';
import 'package:seujcare/pages/expert_pages/expert_profile_page.dart';
import 'package:seujcare/pages/expert_pages/all_query_screen.dart';

class ExpertMainScreen extends StatefulWidget {
  const ExpertMainScreen({super.key});

  @override
  State<ExpertMainScreen> createState() => _ExpertMainScreenState();
}

class _ExpertMainScreenState extends State<ExpertMainScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [
    ExpertHomeScreen(),
    IssueAssignedScreen(),
    ExpertProfile(
      isAdmin: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomBarDefault(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indexSelected: selectedIndex,
          items: const [
            TabItem(icon: Iconsax.home_1, title: 'Home'),
            TabItem(icon: Iconsax.message, title: 'Farmers Query'),
            TabItem(icon: Iconsax.user, title: 'Profile'),
          ],
          backgroundColor: Colors.white,
          color: Colors.black,
          colorSelected: Colors.green),
    );
  }
}
