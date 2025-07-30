import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  final List<String?> genres;
  const GenreItem({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres.map((genre) {
        return Chip(
          label: Text(
            '$genre',
            style: TextStyle(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        );
      }).toList(),
    );
  }
}
