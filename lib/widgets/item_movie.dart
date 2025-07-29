import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/data/utils.dart';
import 'package:flutter_apps/widgets/item_genres.dart';
import 'package:flutter_apps/widgets/rating.dart';

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
                child: Hero(
                  tag: title,
                  child: CachedNetworkImage(
                    imageUrl: getImageUrl(imgUrl),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
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
                    Rating(rating: rating),
                    SizedBox(width: 16),
                    Icon(Icons.whatshot, color: Colors.orange),
                    SizedBox(width: 8),
                    Text(popularity, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 16),
                GenreItem(genres: genres),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
