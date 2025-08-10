import 'package:flutter/material.dart';
import '../data/biology_data.dart';
import '../models/biology_term.dart';

class QuizQuestionScreen extends StatefulWidget {
  @override
  _QuizQuestionScreenState createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  bool showResult = false;

  QuizQuestion get currentQuestion =>
      BiologyData.quizQuestions[currentQuestionIndex];

  void _selectAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  void _nextQuestion() {
    if (selectedAnswerIndex == currentQuestion.correctAnswerIndex) {
      score++;
    }

    if (currentQuestionIndex < BiologyData.quizQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      setState(() {
        showResult = true;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswerIndex = null;
      score = 0;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Quiz Results'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quiz Complete!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Your Score: $score/${BiologyData.quizQuestions.length}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _restartQuiz,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2196F3),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text(
                    'Restart Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${BiologyData.quizQuestions.length}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            // Progress bar
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / BiologyData.quizQuestions.length,
              backgroundColor: Color(0xFF3A3A3A),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 40),
            Text(
              currentQuestion.question,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedAnswerIndex == index;
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () => _selectAnswer(index),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xFF2196F3) : Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? Color(0xFF2196F3) : Color(0xFF3A3A3A),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected ? Colors.white : Colors.transparent,
                                border: Border.all(
                                  color: isSelected ? Colors.white : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: isSelected
                                  ? Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: Color(0xFF2196F3),
                                    )
                                  : null,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                currentQuestion.options[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: selectedAnswerIndex != null ? _nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2196F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentQuestionIndex < BiologyData.quizQuestions.length - 1
                      ? 'Next'
                      : 'Finish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}