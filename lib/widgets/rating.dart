import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final String rating;
  const Rating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 8),
        Text('$rating/10 IMDb', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
