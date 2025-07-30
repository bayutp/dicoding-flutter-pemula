import 'package:flutter/material.dart';
import 'package:flutter_apps/models/movie_list.dart';
import 'package:flutter_apps/screens/movies_screen.dart';

class BookmarkScreen extends StatelessWidget {
  final List<Movie> bookmarked;
  final Function(Movie) onTap;

  const BookmarkScreen({
    super.key,
    required this.bookmarked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MoviesScreen(title: 'Bookmark', movies: bookmarked, onTap: onTap);
  }
}
