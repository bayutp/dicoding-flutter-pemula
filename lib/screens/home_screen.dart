import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_apps/data/utils.dart';
import 'package:flutter_apps/models/movie_list.dart';
import 'package:flutter_apps/screens/movies_screen.dart';
import 'package:flutter_apps/widgets/item_movie.dart';
import 'package:flutter_apps/widgets/item_movie_banner.dart';
import 'package:flutter_apps/widgets/title_category.dart';

class HomeScreen extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) onTap;

  const HomeScreen({super.key, required this.movies, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final popular = List.of(movies)
      ..sort((a, b) => (b.voteAverage ?? 0).compareTo((a.voteAverage ?? 0)));
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'FilmKu',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              TitleCategory(
                title: 'Now Playing',
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviesScreen(
                        title: 'Now Playing',
                        movies: movies,
                        onTap: onTap,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return SizedBox(
                      width: 200,
                      child: InkWell(
                        onTap: () => onTap(movie),
                        child: ItemMovieBanner(
                          imgUrl: getImageUrl(movie.posterPath),
                          title: '${movie.title}',
                          rating: movie.voteAverage?.toStringAsFixed(1) ?? "0",
                        ),
                      ),
                    );
                  },
                  itemCount: min(movies.length, 5),
                ),
              ),
              TitleCategory(
                title: 'Top Rated',
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviesScreen(
                        title: 'Top Rated',
                        movies: popular,
                        onTap: onTap,
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final movie = popular[index];
                  return Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () => onTap(movie),
                      child: ItemMovie(
                        imgUrl: getImageUrl(movie.posterPath),
                        title: '${movie.title}',
                        rating: movie.voteAverage?.toStringAsFixed(1) ?? "0",
                        genres: getGenres(movie.genreIds ?? []),
                        popularity: movie.popularity.toString(),
                      ),
                    ),
                  );
                },
                itemCount: min(movies.length, 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
