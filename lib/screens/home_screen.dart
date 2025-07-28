import 'package:flutter/material.dart';
import 'package:flutter_apps/data/movie_dummy.dart';
import 'package:flutter_apps/data/utils.dart';
import 'package:flutter_apps/widgets/item_movie_banner.dart';

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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final movie = movieDummy[index];
            return SizedBox(
              width: 200,
              child: ItemMovieBanner(
                imgUrl: getImageUrl(movie.posterPath),
                title: movie.title ?? "",
                rating: movie.voteAverage?.toStringAsFixed(1) ?? "0",
              ),
            );
          },
          itemCount: movieDummy.take(5).length,
        ),
      ),
    );
  }
}
