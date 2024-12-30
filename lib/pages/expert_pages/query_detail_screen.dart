import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/query_model.dart';
import 'package:seujcare/pages/expert_pages/expert_chat_screen.dart';
import 'package:seujcare/providers/chat_provider.dart';
import 'package:seujcare/providers/query_provider.dart';
import 'package:seujcare/utils/commons.dart';

class IssueDetailScreen extends StatelessWidget {
  final QueryModel model;
  const IssueDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QueryProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/tomatoe.webp'),
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.createdBy,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  model.timestamp.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Iconsax.arrow_left),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset('assets/tomatoe.webp')),
          ),
          Gap(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.queryId,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  model.category,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green),
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Gap(13),
                Text(
                  model.query,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              color: Colors.green,
              height: 60,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                navigateToScreen(
                    context,
                    ExpertChatScreen(
                      model: model,
                    ));
              },
              child: const Text(
                'Chat now!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Gap(20),
        ],
      ),
    );
  }
}
