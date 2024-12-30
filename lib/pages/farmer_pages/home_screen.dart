import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/crop_disease_model.dart';
import 'package:seujcare/pages/farmer_pages/ask_expert_screen.dart';
import 'package:seujcare/pages/farmer_pages/crop_desease_screen.dart';
import 'package:seujcare/pages/farmer_pages/crop_detail_screen.dart';
import 'package:seujcare/pages/farmer_pages/crop_list_screen.dart';
import 'package:seujcare/pages/farmer_pages/login_signup_screen.dart';
import 'package:seujcare/pages/farmer_pages/market_details_screen.dart';
import 'package:seujcare/pages/farmer_pages/post_screen.dart';
import 'package:seujcare/pages/farmer_pages/product_screen.dart';
import 'package:seujcare/pages/farmer_pages/profile_screen.dart';
import 'package:seujcare/pages/farmer_pages/season_details_screen.dart';
import 'package:seujcare/providers/crop_provider.dart';
import 'package:seujcare/services/auth_service.dart';
import 'package:seujcare/widgets/home_screen_widgets/home_category_widget.dart';
import 'package:seujcare/widgets/home_screen_widgets/home_trending_card_widget.dart';
import 'package:seujcare/widgets/home_screen_widgets/search_widget.dart';
import 'package:seujcare/widgets/shared_widgets/section_title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CropProvider>(context, listen: false);
    return Scaffold(
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: RichText(
            text: TextSpan(
                text: "Seuj ",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: [
              TextSpan(
                  text: "Care",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade600)),
            ])),
        backgroundColor: Colors.green.shade100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            const SearchWidget(),
            const SectionTitle(title: 'Crops'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: provider.crops.isEmpty
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Text('No Data Found')))
                  : Row(children: [
                      const Gap(15),
                      ...List.generate(
                        provider.crops.length,
                        (index) {
                          return HomeCategory(
                            // image:
                            //     "https://media.istockphoto.com/id/622925154/photo/ripe-rice-in-the-field-of-farmland.jpg?s=2048x2048&w=is&k=20&c=auNzfGt6fX1e_w2fvW0CgyRURKMGiL-P2ZnwA8tw1ic=",
                            image: provider.crops[index].cropUrl,
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CropDetailsScreen(),
                            )),
                            text1: provider.crops[index].name,
                          );
                        },
                      ),
                      const Gap(15),
                    ]),
            ),
            const Gap(15),
            const SectionTitle(
              title: 'Issues',
            ),
            const Gap(15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: provider.cropDiseases.isEmpty
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Text('No Data Found')))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        ...List.generate(
                          provider.cropDiseases.length,
                          (index) {
                            return TrendingCard(
                              cropDisease: provider.cropDiseases[index],
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ArticleScreen(),
                                ));
                              },
                              index: index,
                            );
                          },
                        ),
                      ]),
                    ),
            ),
            const Gap(20),
            // const SectionTitle(
            //   title: 'Crops',
            // ),
            // const Gap(15),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(children: [
            //     const Gap(15),
            //     ...List.generate(
            //       5,
            //       (index) {
            //         return HomeCategory(
            //           text1: cropslist[index],
            //           image:
            //               'https://gardenseasons.com/wp-content/uploads/2020/04/Garden-in-late-summer-_-summer-garden-crops-_-ss-_-featured.jpg',
            //           onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) => const ProductDetailsScreen(),
            //           )),
            //         );
            //       },
            //     ),
            //     const Gap(15),
            //   ]),
            // ),
            // const Gap(15),
            const SectionTitle(
              title: 'Seasonal',
            ),
            const Gap(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: provider.seasons.isEmpty
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: const Text('No Data Found')))
                  : Row(children: [
                      const Gap(15),
                      ...List.generate(
                        provider.seasons.length,
                        (index) {
                          return Container(
                            height: 120,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(3, 3))
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 7),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      height: 120,
                                      width: 200,
                                      fit: BoxFit.cover,
                                      provider.seasons[index].image,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return SizedBox(
                                            height: 60,
                                            child: const Icon(Iconsax.image5));
                                      },
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    provider.seasons[index].name,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const Gap(15),
                    ]),
            ),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AskExpertScreen(),
                )),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 236, 238, 235)),
                  child: Image.network(
                      height: 30,
                      "http://www.askexperts.pro/wp-content/uploads/2024/01/logo.png"),
                ),
              ),
            ),
            const Gap(40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: kToolbarHeight,
        decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Center(
          child: IconButton(
            icon: const Icon(Icons.home, size: 40, color: Colors.green),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('myBox');
    var session = box.get('session', defaultValue: {});
    Map<String, dynamic> user = Map<String, dynamic>.from(session);
    print(session.toString());
    return Drawer(
      child: Container(
        color: Colors.green[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.green[700],
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.green[700],
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Hello, ${user['name']}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Your farming companion",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  DrawerItem(
                    icon: Icons.home,
                    title: "Home",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.trending_up,
                    title: "Crops",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CropListScreen(),
                      ));
                    },
                  ),
                  DrawerItem(
                    icon: Icons.bug_report,
                    title: "Diseases",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CropDiseaseDetailsPage(),
                      ));
                    },
                  ),
                  DrawerItem(
                    icon: Icons.question_answer,
                    title: "Ask Expert",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AskExpertScreen(),
                      ));
                    },
                  ),
                  DrawerItem(
                    icon: Icons.business_outlined,
                    title: "Market Details",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MarketScreen(),
                      ));
                    },
                  ),
                  DrawerItem(
                    icon: Icons.cloud,
                    title: "Season Details",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SeasonsInformationScreen(),
                      ));
                    },
                  ),
                  DrawerItem(
                    icon: Icons.settings,
                    title: "Settings",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileSettingsScreen(),
                      ));
                    },
                  ),
                ],
              ),
            ),

            // Footer with Logout Option
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, color: Colors.redAccent),
                ),
                onTap: () async {
                  var response = await AuthenticationServices().logOut();
                  if (response == null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(response),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  DrawerItem({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.green[700]),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
