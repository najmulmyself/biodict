import 'package:flutter/material.dart';
import '../data/biology_data.dart';
import '../models/biology_term.dart';
import 'term_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<BiologyTerm> _suggestions = [];
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _searchController.text = 'Cell';
    _updateSuggestions('Cell');
  }

  void _updateSuggestions(String query) {
    if (query.isEmpty) {
      setState(() {
        _suggestions = [];
        _showSuggestions = false;
      });
      return;
    }

    setState(() {
      _suggestions = BiologyData.terms
          .where((term) => term.name.toLowerCase().contains(query.toLowerCase()))
          .take(5)
          .toList();
      _showSuggestions = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _updateSuggestions,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search terms...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            _searchController.clear();
                            _updateSuggestions('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          if (_showSuggestions) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Suggestions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  final term = _suggestions[index];
                  return ListTile(
                    title: Text(
                      term.name,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermDetailScreen(term: term),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}