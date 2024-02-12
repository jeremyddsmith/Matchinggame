import 'package:flutter/material.dart';

const Color continueButtonColor = Color.fromRGBO(235, 32, 93, 1);
const Color restartButtonColor = Color.fromRGBO(243, 181, 45, 1);
const Color quitButtonColor = Color.fromRGBO(39, 162, 149, 1);

const List<Map<String, dynamic>> gameLevels = [
  {'title': '4 x 4', 'level': 4, 'color': Colors.amberAccent},
  {'title': '6 x 6', 'level': 6, 'color': Colors.blueAccent},
  {'title': '8 x 8', 'level': 8, 'color': Colors.cyanAccent},
];

const String gameTitle = 'Transformers Memory Match';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Match Game',
      home: Scaffold(
        appBar: AppBar(
          title: Text(gameTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Explanation of how the memory matching game works
              Text(
                'How to Play:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Memory matching games involve players trying to find matching pairs of cards, usually with images or symbols on them. In our game, players will be presented with a grid of cards facedown. They can then flip two cards at a time to reveal what\'s underneath. If the two cards match, they remain face-up. Otherwise, they are flipped face-down again. The game continues until all pairs have been matched. Players can select different levels of difficulty, which change the size of the grid and the number of cards to match. The goal is to match all pairs as fast as possible.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // Display game grid options
              Text(
                'Choose a Game Level:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: gameLevels.map((level) {
                  return ElevatedButton(
                    onPressed: () {
                      // Add functionality to start game with selected level
                    },
                    child: Text(level['title']),
                    style: ElevatedButton.styleFrom(
                      primary: level['color'],
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}