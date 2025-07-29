import 'package:flutter/material.dart';
import 'package:flutter_apps/data/utils.dart';
import 'package:flutter_apps/models/movie_list.dart';
import 'package:flutter_apps/widgets/item_movie.dart';

class MoviesScreen extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final Function(Movie) onTap;

  const MoviesScreen({
    super.key,
    required this.title,
    required this.movies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: movies.isEmpty ? emptyList() : showList(movies, onTap),
    );
  }

  Widget emptyList() {
    return Center(
      child: Text(
        'Data Bookmark masih kosong',
        style: TextStyle(fontFamily: 'Poppins', color: Colors.grey),
      ),
    );
  }

  Widget showList(List<Movie> movies, Function(Movie) onTap) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: InkWell(
            onTap: () => onTap(movie),
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
      itemCount: movies.length,
    );
  }
}
