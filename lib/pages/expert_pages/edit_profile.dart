import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ExpertEditProfileScreen extends StatelessWidget {
  const ExpertEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Iconsax.arrow_left_2),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(10),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/tomatoe.webp'),
                  ),
                  Positioned(
                      bottom: 4,
                      right: 0,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        padding: const EdgeInsets.all(10),
                        onPressed: () {},
                        minWidth: 40,
                        color: const Color.fromARGB(255, 106, 212, 110),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
            const Gap(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    TextField(
                      decoration: InputDecoration(hintText: 'Name'),
                    )
                  ],
                ),
              ),
            ),
            const Gap(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone'),
                    TextField(
                      decoration: InputDecoration(hintText: 'Phone'),
                    )
                  ],
                ),
              ),
            ),
            const Gap(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address'),
                    TextField(
                      decoration: InputDecoration(hintText: 'Address'),
                    )
                  ],
                ),
              ),
            ),
            const Gap(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Qualification'),
                    TextField(
                      decoration: InputDecoration(hintText: 'Qualification'),
                    )
                  ],
                ),
              ),
            ),
            Gap(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email'),
                    TextField(
                      decoration: InputDecoration(hintText: 'Email'),
                    )
                  ],
                ),
              ),
            ),
            Gap(30)
          ],
        ),
      ),
    );
  }
}
