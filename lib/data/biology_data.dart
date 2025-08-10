import 'package:flutter/material.dart';
import '../models/biology_term.dart';

class BiologyData {
  static List<BiologyCategory> categories = [
    BiologyCategory(
      name: 'Genetics',
      icon: Icons.biotech,
      description: 'Study of heredity and genes',
    ),
    BiologyCategory(
      name: 'Ecology',
      icon: Icons.eco,
      description: 'Study of organisms and environment',
    ),
    BiologyCategory(
      name: 'Microbiology',
      icon: Icons.search,
      description: 'Study of microscopic organisms',
    ),
    BiologyCategory(
      name: 'Anatomy',
      icon: Icons.favorite,
      description: 'Study of body structure',
    ),
    BiologyCategory(
      name: 'Neuroscience',
      icon: Icons.psychology,
      description: 'Study of nervous system',
    ),
    BiologyCategory(
      name: 'Botany',
      icon: Icons.local_florist,
      description: 'Study of plants',
    ),
  ];

  static List<BiologyTerm> terms = [
    BiologyTerm(
      name: 'Cell',
      definition: 'The basic structural and functional unit of all known living organisms. It is the smallest unit of life that can replicate independently, and it is often called the building block of life. Cells are highly organized structures that contain a variety of organelles, each with a specific function. These organelles work together to carry out the essential processes of life, such as metabolism, growth, and reproduction.',
      category: 'Cell Biology',
      relatedTerms: ['Organelle', 'Cytoplasm', 'Nucleus'],
      isFavorite: true,
    ),
    BiologyTerm(
      name: 'Photosynthesis',
      definition: 'The process by which plants convert light energy into chemical energy in the form of sugars.',
      category: 'Botany',
      relatedTerms: ['Chloroplast', 'Glucose', 'Carbon Dioxide'],
      isFavorite: true,
    ),
    BiologyTerm(
      name: 'Genome',
      definition: 'The genetic material of an organism, consisting of DNA or RNA.',
      category: 'Genetics',
      relatedTerms: ['DNA', 'RNA', 'Chromosome'],
      isFavorite: true,
    ),
    BiologyTerm(
      name: 'Mitosis',
      definition: 'The process of cell division that results in two identical daughter cells.',
      category: 'Cell Biology',
      relatedTerms: ['Cell Division', 'Chromosome', 'Cytokinesis'],
      isFavorite: true,
    ),
    BiologyTerm(
      name: 'Meiosis',
      definition: 'The process of cell division that results in four daughter cells with half the number of chromosomes.',
      category: 'Genetics',
      relatedTerms: ['Gamete', 'Chromosome', 'Sexual Reproduction'],
      isFavorite: true,
    ),
    BiologyTerm(
      name: 'Cellular',
      definition: 'Relating to or consisting of cells.',
      category: 'Cell Biology',
      relatedTerms: ['Cell', 'Tissue', 'Organism'],
    ),
    BiologyTerm(
      name: 'Cellular Respiration',
      definition: 'The process by which cells break down glucose to produce energy.',
      category: 'Cell Biology',
      relatedTerms: ['Glucose', 'ATP', 'Mitochondria'],
    ),
    BiologyTerm(
      name: 'Cell Wall',
      definition: 'A rigid layer that surrounds the cell membrane in plants and some other organisms.',
      category: 'Cell Biology',
      relatedTerms: ['Cell Membrane', 'Cellulose', 'Plant Cell'],
    ),
    BiologyTerm(
      name: 'Cell Membrane',
      definition: 'The thin barrier that surrounds the cell and controls what enters and exits.',
      category: 'Cell Biology',
      relatedTerms: ['Phospholipid', 'Protein', 'Permeability'],
    ),
  ];

  static List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      question: 'What is the term for the study of living organisms and their vital processes?',
      options: ['Biology', 'Chemistry', 'Physics', 'Geology'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'What is the powerhouse of the cell?',
      options: ['Nucleus', 'Mitochondria', 'Ribosome', 'Golgi Apparatus'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Which process do plants use to make their own food?',
      options: ['Respiration', 'Photosynthesis', 'Digestion', 'Fermentation'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'What is the basic unit of heredity?',
      options: ['Cell', 'Gene', 'Tissue', 'Organ'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Which organelle contains the cell\'s genetic material?',
      options: ['Cytoplasm', 'Nucleus', 'Vacuole', 'Chloroplast'],
      correctAnswerIndex: 1,
    ),
  ];
}