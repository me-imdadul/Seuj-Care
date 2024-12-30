import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'package:seujcare/pages/admin_pages/query_detail_screen.dart';

import 'package:seujcare/providers/query_provider.dart';
import 'package:seujcare/utils/commons.dart';
import 'package:seujcare/utils/constants.dart';

class FarmerIssueScreen extends StatefulWidget {
  const FarmerIssueScreen({super.key});

  @override
  State<FarmerIssueScreen> createState() => _FarmerIssueScreenState();
}

class _FarmerIssueScreenState extends State<FarmerIssueScreen> {
  Box box = Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QueryProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbgColor,
        title: const Text('Recent Issues'),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: List.generate(
                  provider.queries.length,
                  (index) {
                    return FadeInUp(
                        delay: Duration(milliseconds: index * 80),
                        child: GestureDetector(
                            onTap: () async {
                              navigateToScreen(
                                  context,
                                  QueryDetailScreen(
                                      isAdmin: true,
                                      model: provider.queries[index]));
                            },
                            child: Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          spreadRadius: 3,
                                          blurRadius: 4,
                                          offset: Offset(3, 3))
                                    ]),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: FileImage(
                                        File(provider.queries[index].image),
                                      ),
                                    ),
                                    Gap(10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Gap(5),
                                          Text(
                                            provider.queries[index].createdBy,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Gap(5),
                                          Text(
                                            provider.queries[index].query,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
