import 'package:flutter/material.dart';
import 'package:flutter_apps/data/utils.dart';
import 'package:flutter_apps/models/movie_list.dart';
import 'package:flutter_apps/widgets/item_genres.dart';
import 'package:flutter_apps/widgets/rating.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  final Function(Movie) onBookmarkChanged;
  
  const DetailScreen({
    super.key,
    required this.movie,
    required this.onBookmarkChanged,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.movie.isBookmark ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Image.network(
                    getImageUrl(widget.movie.backdropPath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.movie.title ?? '',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isBookmarked = !isBookmarked;
                              widget.movie.isBookmark = isBookmarked;
                            });
                            widget.onBookmarkChanged(widget.movie);
                          },
                          icon: Icon(
                            isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Rating(
                      rating:
                          widget.movie.voteAverage?.toStringAsFixed(1) ?? '0',
                    ),
                    SizedBox(height: 16),
                    GenreItem(genres: getGenres(widget.movie.genreIds ?? [])),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Release Date',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 8),
                              Text(
                                dateFormat(
                                  widget.movie.releaseDate ?? '29-07-2025',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Language',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 8),
                              Text(widget.movie.originalLanguage ?? 'English'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Popularity',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 8),
                              Text(widget.movie.popularity.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.movie.overview ?? '',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
