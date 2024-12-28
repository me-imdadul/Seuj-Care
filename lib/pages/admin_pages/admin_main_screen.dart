import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seujcare/pages/admin_pages/add_categories_screen.dart';
import 'package:seujcare/pages/admin_pages/admin_expert_list_screen.dart';
import 'package:seujcare/pages/admin_pages/admin_home_screen.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  List<Widget> pages = [
    const AdminHomeScreen(),
    const AddCategoriesScreen(),
    const AdminExpertScreen(),
  ];

  int selectedIndex = 0;

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
            TabItem(icon: Iconsax.global, title: 'Explore'),
            TabItem(icon: Iconsax.box, title: 'Categories'),
            TabItem(icon: Iconsax.user, title: 'Experts'),
          ],
          backgroundColor: Colors.white,
          color: Colors.black,
          colorSelected: Colors.green),
    );
  }
}
