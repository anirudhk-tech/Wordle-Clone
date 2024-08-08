import 'package:flutter/material.dart';
import 'package:wordpair/widgets/Home%20Page/word_alert.dart';
import 'package:wordpair/widgets/Home%20Page/word_input.dart';
import 'package:wordpair/widgets/Home%20Page/wordle_row.dart';
import 'package:wordpair/widgets/Home%20Page/wrong_row.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({super.key});

  @override
  Widget build (BuildContext context) {

    return const Expanded (
      child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WordAlert(),
            Spacer(),
            Expanded(
              flex: 2,
              child: WordleRow(),
            ),
            Spacer(),
            Expanded (
              child: WordleInput(),
            ),
            Spacer(),
            Expanded (
              child: WrongRow(),
            ),
            Spacer(),
          ]
        )
      );
    }
  }