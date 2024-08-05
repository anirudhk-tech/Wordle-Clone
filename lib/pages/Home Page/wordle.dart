import 'package:flutter/material.dart';
import 'package:wordpair/theme.dart';
import 'package:wordpair/widgets/Home%20Page/word_alert.dart';
import 'package:wordpair/widgets/Home%20Page/word_input.dart';
import 'package:wordpair/widgets/Home%20Page/wordle_row.dart';
import 'package:wordpair/widgets/Home%20Page/wrong_row.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({super.key});

  @override
  Widget build (BuildContext context) {
    
    return Container (
      color: ThemeContext.wordleTheme.secondaryHeaderColor,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WordAlert(),
          SizedBox(height: 100,),
          WordleRow(),
          SizedBox(height: 100,),
          WordleInput(),
          SizedBox(height: 100,),
          WrongRow(),
        ]
      )
    );
  }
}