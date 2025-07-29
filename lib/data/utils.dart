import 'package:flutter_apps/data/movie_dummy.dart';
import 'package:flutter_apps/models/genre_list.dart';
import 'package:intl/intl.dart';

var getImageUrl = (String? path) => 'https://image.tmdb.org/t/p/w500$path';

var getGenres = (List<int> ids) => ids
    .map(
      (id) => genres
          .firstWhere(
            (genre) => genre.id == id,
            orElse: () => Genre(id: id, name: 'Unknown'),
          )
          .name,
    )
    .toList();

var dateFormat = (String date) =>
    DateFormat('MMMM dd yyyy').format(DateTime.parse(date));
