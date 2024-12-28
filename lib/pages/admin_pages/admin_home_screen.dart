import 'package:animate_do/animate_do.dart';
import 'package:fast_charts/fast_charts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/pages/admin_pages/farmer_issue_screen.dart';
import 'package:seujcare/providers/admin_provider.dart';
import 'package:seujcare/repository/dashboard_repository.dart';
import 'package:seujcare/utils/constants.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  List<String> categories = [
    "Overview",
    "Issues",
    "Crops",
    "Farmers",
    "Trending"
  ];
  final repository = DashboardRepository();

  @override
  void didChangeDependencies() {
    Provider.of<AdminProvider>(context, listen: false)
        .setDashboardData(repository.adminDashboardData());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AdminProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: kbgColor,
        backgroundColor: kbgColor,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Icon(
                Iconsax.user,
                size: 20,
              ),
            ),
            Gap(10),
            Text(
              'Good Morning!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      backgroundColor: kbgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Gap(20),
                  ...List.generate(
                    categories.length,
                    (index) => FadeInRight(
                      curve: Curves.ease,
                      delay: Duration(milliseconds: index * 200),
                      child: GestureDetector(
                          child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
            const Gap(25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Data',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Gap(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInRight(
                        curve: Curves.ease,
                        delay: const Duration(milliseconds: 0),
                        child: Container(
                          height: 115,
                          width: 115,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade300.withOpacity(0.1),
                                    offset: const Offset(2, 6),
                                    blurRadius: 6,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider.data.farmersCount.toString(),
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                              const Text(
                                'Farmers',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(10),
                      FadeInRight(
                        curve: Curves.ease,
                        delay: const Duration(milliseconds: 200),
                        child: Container(
                          height: 115,
                          width: 115,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade300.withOpacity(0.1),
                                    offset: const Offset(2, 6),
                                    blurRadius: 6,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider.data.expertsCount.toString(),
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                              const Text(
                                'Experts',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(10),
                      FadeInRight(
                        curve: Curves.ease,
                        delay: const Duration(milliseconds: 400),
                        child: Container(
                          height: 115,
                          width: 115,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade300.withOpacity(0.1),
                                    offset: const Offset(2, 6),
                                    blurRadius: 6,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider.data.issuesCount.toString(),
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                              const Text(
                                'Issues',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Gap(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 300,
                child: PieChart(
                  holeSize: 0.4,
                  data: Series(
                    data: {
                      'Farmers': provider.data.farmersCount,
                      'Experts': provider.data.expertsCount,
                      'Issues': provider.data.issuesCount
                    },
                    colorAccessor: (domain, value) {
                      if (domain == 'alpha') {
                        return Colors.green;
                      } else if (domain == 'gamma') {
                        return Colors.orange;
                      }

                      return Colors.yellow;
                    },
                    measureAccessor: (value) => value.toDouble(),
                    labelAccessor: (domain, value, percent) => ChartLabel(
                      '${percent}%',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                  animationCurve: Curves.bounceIn,
                  animationDuration: const Duration(milliseconds: 1500),
                ),
              ),
            ),
            const Gap(25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'More',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Gap(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FarmerIssueScreen(),
                    )),
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Recent Issues by farmer',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const Gap(5),
                              Text('(${provider.data.createdIssueCount})'),
                            ],
                          ),
                          const Icon(
                            Iconsax.arrow_right_1,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Assign Experts',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const Gap(5),
                            Text('(${provider.data.expertsCount})'),
                          ],
                        ),
                        const Icon(
                          Iconsax.arrow_right_1,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Recently resolved issue',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const Gap(5),
                            Text('(${provider.data.resolvedIssueCount})'),
                          ],
                        ),
                        const Icon(
                          Iconsax.arrow_right_1,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }
}
