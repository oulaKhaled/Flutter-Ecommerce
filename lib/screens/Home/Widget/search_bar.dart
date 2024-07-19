import 'package:flutter/material.dart';
import 'package:workspace/constants.dart';

class MySearchBAR extends StatelessWidget {
  const MySearchBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.0,
      decoration: BoxDecoration(
          color: kcontentColor,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 30.0,
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 4,
            child: SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                ),
              ),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
