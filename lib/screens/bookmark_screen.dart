import 'package:flutter/material.dart';
import 'package:flutter_apps/data/movie_dummy.dart';
import 'package:flutter_apps/screens/movies_screen.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bookmark = movieDummy
        .where((movie) => movie.isBookmark == true)
        .toList();
    return MoviesScreen(title: 'Bookmark', movieCount: bookmark.length);
  }
}
