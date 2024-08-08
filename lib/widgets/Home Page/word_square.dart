import 'package:flutter/material.dart';
import 'package:wordpair/theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
class WordSquare extends StatelessWidget {
  const WordSquare({
    super.key,
    required this.letter,
  });

  final String letter;

  @override
  Widget build (BuildContext context) {
    var width = MediaQuery.of(context).size.width;


    return Animate (
      effects: letter.isEmpty ? [] : const [FadeEffect(duration: Duration(seconds: 3))],
      child: Container (
        width: width/(7),
        height: width/(7),
        decoration: BoxDecoration (
          color: letter.isEmpty ? ThemeContext.wordleTheme.hintColor : Colors.green,
          border: Border.all(
            color: ThemeContext.wordleTheme.primaryColor, 
            width: 1,
          )
        ),
        child: Center(
          child: Text (
            letter,
            style: ThemeContext.wordleTheme.textTheme.headlineLarge,  
          )
        ),
      )
    );
  }
}