import 'package:flutter/material.dart';
import 'package:flutter_apps/data/movie_dummy.dart';

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: movieDummy
                  .map(
                    (movie) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '${movie.title} status: ${movie.isBookmark ?? false ? 'Bookmark' : 'Not bookmark'}',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
