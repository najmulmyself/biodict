import 'package:flutter/material.dart';
import '../data/biology_data.dart';
import '../models/biology_term.dart';
import 'term_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<BiologyTerm> get favoriteTerms =>
      BiologyData.terms.where((term) => term.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Saved Terms',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: favoriteTerms.length,
              itemBuilder: (context, index) {
                final term = favoriteTerms[index];
                return FavoriteTermCard(
                  term: term,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermDetailScreen(term: term),
                      ),
                    );
                  },
                  onFavoriteToggle: () {
                    setState(() {
                      term.isFavorite = !term.isFavorite;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteTermCard extends StatelessWidget {
  final BiologyTerm term;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const FavoriteTermCard({
    Key? key,
    required this.term,
    required this.onTap,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: IconButton(
                  icon: Icon(
                    term.isFavorite ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      term.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      term.definition.length > 100
                          ? '${term.definition.substring(0, 100)}...'
                          : term.definition,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}