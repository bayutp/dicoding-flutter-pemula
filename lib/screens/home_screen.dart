import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_apps/data/movie_dummy.dart';
import 'package:flutter_apps/data/utils.dart';
import 'package:flutter_apps/screens/detail_screen.dart';
import 'package:flutter_apps/screens/movies_screen.dart';
import 'package:flutter_apps/widgets/item_movie.dart';
import 'package:flutter_apps/widgets/item_movie_banner.dart';
import 'package:flutter_apps/widgets/title_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_outlined),
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
                      builder: (context) => MoviesScreen(title: 'Now Playing'),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final movie = movieDummy[index];
                    return SizedBox(
                      width: 200,
                      child: InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(movie: movie),
                            ),
                          ),
                        },
                        child: ItemMovieBanner(
                          imgUrl: getImageUrl(movie.posterPath),
                          title: movie.title ?? "",
                          rating: movie.voteAverage?.toStringAsFixed(1) ?? "0",
                        ),
                      ),
                    );
                  },
                  itemCount: min(movieDummy.length, 5),
                ),
              ),
              TitleCategory(
                title: 'Top Rated',
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviesScreen(title: 'Top Rated'),
                    ),
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final movie = popularDummy[index];
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
                itemCount: min(popularDummy.length, 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
