import 'package:flutter/material.dart';
import 'package:flutter_apps/data/movie_dummy.dart';
import 'package:flutter_apps/data/utils.dart';
import 'package:flutter_apps/models/movie_list.dart';
import 'package:flutter_apps/screens/detail_screen.dart';
import 'package:flutter_apps/widgets/item_movie.dart';

class MoviesScreen extends StatelessWidget {
  final String title;
  final int movieCount;

  const MoviesScreen({
    super.key,
    required this.title,
    this.movieCount = 20
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Movie movie;
          if (title.toLowerCase() == 'top rated') {
            movie = popularDummy[index];
          } else if (title.toLowerCase() == 'now playing') {
            movie = movieDummy[index];
          } else {
            var bookmark = movieDummy.where(
              (movie) => movie.isBookmark == true,
            ).toList();
            movie = bookmark[index];
          }

          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(movie: movie),
                  ),
                ),
              },
              child: ItemMovie(
                imgUrl: getImageUrl(movie.posterPath),
                title: movie.title ?? "",
                rating: movie.voteAverage?.toStringAsFixed(1) ?? "0",
                genres: getGenres(movie.genreIds ?? []),
                popularity: movie.popularity.toString(),
              ),
            ),
          );
        },
        itemCount: movieCount,
      ),
    );
  }
}
