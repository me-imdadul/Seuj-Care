import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seujcare/widgets/home_screen_widgets/home_category_widget.dart';
import 'package:seujcare/widgets/shared_widgets/section_title_widget.dart';

class CropDetailsScreen extends StatelessWidget {
  const CropDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      'assets/tomatoe.webp',
                    ),
                  ),
                  Gap(10),
                  Text(
                    'Tomato',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Gap(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Gap(10),
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into'),
                  Gap(20),
                  Text(
                    'Harvesting days',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Gap(10),
                  Text(
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece o'),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Season',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See similar',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Gap(10),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(children: [
                      Icon(
                        Iconsax.sun_1,
                        size: 30,
                      ),
                      Gap(20),
                      Text('Summer')
                    ]),
                  ),
                  Gap(20),
                  Text(
                    'Watering Schedule',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Gap(10),
                  Text(
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece o'),
                  Gap(20),
                  Text(
                    'Fertilization Plan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Gap(10),
                  Text(
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece o'),
                  Gap(20),
                  Text(
                    'More Crops',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Gap(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => HomeCategory(
                            text1: 'text1',
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(30)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
