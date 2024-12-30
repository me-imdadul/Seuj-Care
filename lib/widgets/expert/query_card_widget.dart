import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seujcare/models/query_model.dart';

class QueryCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final QueryModel model;
  const QueryCardWidget({super.key, required this.onTap, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 4,
                  spreadRadius: 3,
                  offset: Offset(3, 3))
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/splash/bg_1.png'),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.createdBy,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   model.timestamp.toString(),
                      //   style: TextStyle(fontSize: 12),
                      // )
                    ],
                  ),
                  Gap(1),
                  Text(
                    model.query,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
