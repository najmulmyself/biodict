import 'package:flutter/material.dart';
import '../models/biology_term.dart';

class TermDetailScreen extends StatefulWidget {
  final BiologyTerm term;

  const TermDetailScreen({Key? key, required this.term}) : super(key: key);

  @override
  _TermDetailScreenState createState() => _TermDetailScreenState();
}

class _TermDetailScreenState extends State<TermDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.term.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                widget.term.definition,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            // Cell illustration placeholder
            Container(
              width: double.infinity,
              height: 300,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4A5D4A),
                    Color(0xFF2A3D2A),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color(0xFFFFB347),
                        Color(0xFF4CAF50),
                        Color(0xFF2E7D32),
                      ],
                      stops: [0.0, 0.5, 1.0],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Color(0xFFFFD54F),
                            Color(0xFFFF8F00),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            if (widget.term.relatedTerms.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Related Terms',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.term.relatedTerms.map((relatedTerm) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xFF3A3A3A)),
                      ),
                      child: Text(
                        relatedTerm,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}