import 'package:flutter/material.dart';
import 'package:day11/model/student.dart';
import 'dart:math';

class GuessNameGamePage extends StatefulWidget {
  final List<Student> students;

  const GuessNameGamePage(this.students, {super.key});

  @override
  State<GuessNameGamePage> createState() => GuessNameGamePageState();
}

class GuessNameGamePageState extends State<GuessNameGamePage> {
  final TextEditingController guessController = TextEditingController();
  String? selectedName;
  String rating = "";
  IconData ratingIcon = Icons.games_rounded;

  @override
  void initState() {
    super.initState();
    selectRandomName();
  }

  void selectRandomName() {
    final random = Random();
    final randomIndex = random.nextInt(widget.students.length);
    setState(() {
      selectedName = widget.students[randomIndex].name;
    });
  }

  void checkGuess() {
    if (guessController.text.trim().toLowerCase() == selectedName!.toLowerCase()) {
      setState(() {
        rating = "Correct!";
        ratingIcon = Icons.sentiment_satisfied_alt; 
      });
    } else {
      setState(() {
        rating = "Oops, Wrong! Try Again.";
        ratingIcon = Icons.sentiment_dissatisfied_rounded; 
      });
    }
    guessController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Guess the Name Game"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Try to guess the random name!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: guessController,
              decoration: InputDecoration(
                labelText: "Enter your guess",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: checkGuess,
              child: const Text("Submit"),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(ratingIcon, size: 30, color: Colors.green), 
                const SizedBox(width: 8),
                Text(
                  rating,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectRandomName,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 129, 72, 55),
              ),
              child: const Text(
                "Reset Game",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    guessController.dispose();
    super.dispose();
  }
}
