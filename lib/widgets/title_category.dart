import 'package:flutter/material.dart';

class TitleCategory extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  const TitleCategory({super.key, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          OutlinedButton(
            onPressed: onClick,
            child: Text(
              'See more',
              style: TextStyle(color: Colors.purple, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
