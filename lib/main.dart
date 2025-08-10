import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/search_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/quiz_intro_screen.dart';

void main() {
  runApp(BiologyDictionaryApp());
}

class BiologyDictionaryApp extends StatelessWidget {
  const BiologyDictionaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biology Dictionary',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF1A1A1A),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: MainScreen(),
      routes: {
        '/categories': (context) => CategoriesScreen(),
        '/search': (context) => SearchScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/quiz': (context) => QuizIntroScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1; // Start with Categories

  final List<Widget> _screens = [
    SearchScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    QuizIntroScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF1A1A1A),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
        ],
      ),
    );
  }
}
