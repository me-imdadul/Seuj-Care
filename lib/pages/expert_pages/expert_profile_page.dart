import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seujcare/pages/expert_pages/edit_profile.dart';
import 'package:seujcare/pages/farmer_pages/login_signup_screen.dart';
import 'package:seujcare/services/auth_service.dart';
import 'package:seujcare/utils/commons.dart';

class ExpertProfile extends StatelessWidget {
  const ExpertProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expert Profile',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ExpertEditProfileScreen(),
                ));
              },
              child: const Icon(Icons.edit)),
          Gap(20)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/tomatoe.webp'), // Replace with actual image asset
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Imdadul Haque',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Agricultural Scientist',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // About Section
            const Text(
              'About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Imdadul Haque has over 20 years of experience in sustainable farming practices...',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Specializations:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Gap(20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(225, 222, 255, 210)),
              child: const Row(
                children: [
                  Icon(Iconsax.tree),
                  Gap(10),
                  Text(
                    'Agricultural Scientist',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const Gap(15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(225, 222, 255, 210)),
              child: const Row(
                children: [
                  Icon(Iconsax.tree),
                  Gap(10),
                  Text(
                    'Agricultural Scientist',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const Gap(20),
            const Text(
              'Domain Expertise:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    4,
                    (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueAccent.withOpacity(0.2)),
                        child: Column(
                          children: [
                            Container(
                              child: Text('Scientist'),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Gap(60),
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.green,
              height: 60,
              onPressed: () {
                AuthenticationServices().logOut();
                replaceToScreen(context, LoginPage());
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Log Out',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
