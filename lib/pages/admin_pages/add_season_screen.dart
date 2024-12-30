import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/season_model.dart';
import 'package:seujcare/providers/crop_provider.dart';

class AddSeasonScreen extends StatefulWidget {
  const AddSeasonScreen({super.key});

  @override
  State<AddSeasonScreen> createState() => _AddSeasonScreenState();
}

class _AddSeasonScreenState extends State<AddSeasonScreen> {
  var name = TextEditingController();
  var info = TextEditingController();
  var image = TextEditingController();
  var crops = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CropProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Season Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            provider.seasons.isEmpty
                ? SizedBox()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: List.generate(
                          provider.seasons.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 3))
                                ]),
                            child: Stack(
                              children: [
                                Container(
                                  width: 200,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/tomatoe.webp',
                                          height: 120,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Gap(10),
                                      Text(
                                        provider.seasons[index].name,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const Gap(10)
                                    ],
                                  ),
                                ),
                                Positioned(
                                    right: 10,
                                    top: 10,
                                    child: GestureDetector(
                                      onTap: () async {
                                        var result =
                                            await provider.deleteSeason(index);
                                        if (result == null) {
                                          print('Deleted');
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add a season detail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // final String name;
            // final String information;
            // final String image;
            // final List<String> crops;
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Season name'),
                  TextField(
                    controller: name,
                  ),
                  Gap(10),
                  Text('Season information'),
                  TextField(
                    controller: info,
                  ),
                  Gap(10),
                  Text('Season image url'),
                  TextField(
                    controller: image,
                  ),
                  Gap(10),
                  Text('Season crops'),
                  TextField(
                    controller: crops,
                  ),
                  Gap(10),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.green,
                    onPressed: () async {
                      var seasonData = SeasonModel(
                          name: name.text,
                          information: info.text,
                          image: image.text,
                          crops: [crops.text]);
                      var result = await provider.addSeason(seasonData);
                      if (result == null) {
                        print('Added season');
                      }
                    },
                    child: Text(
                      'Add new',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
