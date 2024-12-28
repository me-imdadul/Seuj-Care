import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seujcare/pages/expert_pages/expert_chat_screen.dart';
import 'package:seujcare/widgets/expert/query_card_widget.dart';

class IssueAssignedScreen extends StatefulWidget {
  const IssueAssignedScreen({super.key});

  @override
  State<IssueAssignedScreen> createState() => _IssueAssignedScreenState();
}

class _IssueAssignedScreenState extends State<IssueAssignedScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Queries'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: controller,
            onTap: (value) {
              setState(() {
                controller.animateTo(value);
              });
            },
            tabs: [
              Tab(text: 'All Queries'),
              Tab(text: 'Recent Chat'),
              Tab(text: 'Completed Queries'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                _buildAllQueries(context),
                _buildRecentChat(context),
                _buildAllQueries(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildAllQueries(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ...List.generate(
              20,
              (index) => QueryCardWidget(
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    ));
  }

  _buildRecentChat(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ...List.generate(
              100,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ExpertChatScreen(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/tomatoe.webp'),
                      ),
                      Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'User',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                      child: Text(
                                    '10+',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )
                              ],
                            ),
                            Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Crops, Plants, Health Tips.',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '12 jul, 2026',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
