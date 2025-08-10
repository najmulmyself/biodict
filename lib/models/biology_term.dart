import 'package:flutter/material.dart';

class BiologyTerm {
  final String name;
  final String definition;
  final String category;
  final List<String> relatedTerms;
  final String? imageUrl;
  bool isFavorite;

  BiologyTerm({
    required this.name,
    required this.definition,
    required this.category,
    this.relatedTerms = const [],
    this.imageUrl,
    this.isFavorite = false,
  });
}

class BiologyCategory {
  final String name;
  final IconData icon;
  final String description;

  BiologyCategory({
    required this.name,
    required this.icon,
    required this.description,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}