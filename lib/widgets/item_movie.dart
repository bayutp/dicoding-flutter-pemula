import 'package:flutter/material.dart';
import 'package:flutter_apps/data/utils.dart';

class ItemMovie extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String rating;
  final List<String?> genres;
  final String popularity;

  const ItemMovie({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.rating,
    required this.genres,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 6),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.network(getImageUrl(imgUrl)),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 8),
                    Text('$rating/10 IMDb', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 16),
                    Icon(Icons.whatshot, color: Colors.orange),
                    SizedBox(width: 8),
                    Text(popularity, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 16),
                Wrap(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
