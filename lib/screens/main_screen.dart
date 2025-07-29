import 'package:flutter/material.dart';
import 'package:flutter_apps/data/movie_dummy.dart';
import 'package:flutter_apps/models/movie_list.dart';
import 'package:flutter_apps/screens/bookmark_screen.dart';
import 'package:flutter_apps/screens/detail_screen.dart';
import 'package:flutter_apps/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Movie> movies = movieDummy;

  List<Widget> get _screens => [
    HomeScreen(movies: movies, onTap: navigateToDetail),
    BookmarkScreen(
      bookmarked: movies.where((m) => m.isBookmark == true).toList(),
      onTap: navigateToDetail,
    ),
  ];

  void updateMovie(Movie updatedMovie) {
    final index = movies.indexWhere((m) => m.id == updatedMovie.id);
    if (index != -1) {
      setState(() {
        movies[index] = updatedMovie;
      });
    }
  }

  void navigateToDetail(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailScreen(movie: movie, onBookmarkChanged: updateMovie),
      ),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey[300],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
        ],
      ),
    );
  }
}
