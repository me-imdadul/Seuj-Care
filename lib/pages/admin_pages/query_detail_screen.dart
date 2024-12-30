import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/models/admin_model.dart';
import 'package:seujcare/models/query_model.dart';
import 'package:seujcare/pages/expert_pages/expert_profile_page.dart';
import 'package:seujcare/providers/admin_provider.dart';
import 'package:seujcare/providers/expert_provider.dart';
import 'package:seujcare/providers/query_provider.dart';
import 'package:seujcare/utils/commons.dart';

class QueryDetailScreen extends StatefulWidget {
  final bool isAdmin;
  final QueryModel model;

  const QueryDetailScreen(
      {super.key, required this.isAdmin, required this.model});

  @override
  State<QueryDetailScreen> createState() => _QueryDetailScreenState();
}

class _QueryDetailScreenState extends State<QueryDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  void getQueryDetail(String queryId) async {
    var provider = await Provider.of<QueryProvider>(context, listen: false)
        .queryDetail(queryId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AdminProvider>(context, listen: false);
    var provider2 = Provider.of<QueryProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    File(widget.model.image),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        child: Image.asset('assets/tomatoe.webp'),
                      );
                    },
                  )),
              const Gap(20),
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Category',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Text(
                      widget.model.category,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const Text(
                'Created By',
                style: TextStyle(fontSize: 24),
              ),
              const Gap(10),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Iconsax.user4,
                      color: Colors.white,
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.model.createdBy),
                      Text(widget.model.queryId),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                'Query',
                style: TextStyle(fontSize: 24),
              ),
              const Gap(10),
              Text(widget.model.query),
              const Gap(20),
              const Text(
                'Expert Assigned',
                style: TextStyle(fontSize: 24),
              ),
              const Gap(10),
              Text(widget.model.assignedTo == ''
                  ? "None"
                  : widget.model.assignedTo),
              const Gap(20),
              widget.isAdmin
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 60),
                            side: BorderSide(width: 1, color: Colors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            foregroundColor: Colors.green,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Assign Expert'),
                                scrollable: true,
                                content: provider.experts.isEmpty
                                    ? Text('No Expert Found!')
                                    : Column(
                                        children: List.generate(
                                          provider.experts.length,
                                          (index) => ListTile(
                                            onTap: () async {
                                              var result =
                                                  await provider2.updateQuery(
                                                      widget.model.queryId,
                                                      QueryModel(
                                                          category: widget
                                                              .model.category,
                                                          image: widget
                                                              .model.image,
                                                          status: widget
                                                              .model.status,
                                                          query: widget
                                                              .model.query,
                                                          assignedTo: provider
                                                              .experts[index]
                                                              .email,
                                                          queryId: widget
                                                              .model.queryId,
                                                          createdBy: widget
                                                              .model.createdBy,
                                                          timestamp: widget
                                                              .model
                                                              .timestamp));
                                              if (result == null) {
                                                print("Updated");
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                showSnackBar(context,
                                                    "Assigned ${provider.experts[index].name}");
                                              } else {
                                                Navigator.pop(context);
                                                showSnackBar(context, result);
                                              }
                                            },
                                            leading: const Icon(Iconsax.user),
                                            title: Text(
                                                provider.experts[index].name),
                                            subtitle: Text(provider
                                                .experts[index]
                                                .specializations[0]),
                                          ),
                                        ),
                                      ),
                              ),
                            );
                          },
                          child: const Text(
                            'Assign Expert',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const Gap(10),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () async {
                            var result = await provider2
                                .deleteQuery(widget.model.queryId);
                            if (result == null) {
                              print("Deleted");
                              Navigator.pop(context);
                            }
                          },
                          color: Colors.green,
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    )
                  : MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      color: Colors.green,
                      child: const Text(
                        'Chat Now',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
