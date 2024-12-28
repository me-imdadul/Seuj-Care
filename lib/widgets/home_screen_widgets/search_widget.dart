import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 5, blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.green,
              decoration: InputDecoration(
                  hintText: "Search here..",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey.shade500)),
            ),
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
