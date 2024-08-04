import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpair/controller.dart';
import 'package:wordpair/theme.dart';


class WordSquare extends StatelessWidget {
  const WordSquare({
    super.key,
    required this.letter,
    required this.color,
  });

  final String letter;
  final Color color;

  @override
  Widget build (BuildContext context) {
    final controller = Get.find<WordController>();
    var width = MediaQuery.of(context).size.width;
    var wordLen = controller.word.value.length;


    return Container (
      width: width/(wordLen + 2),
      height: width/(wordLen + 2),
      decoration: BoxDecoration (
        color: ThemeContext.wordleTheme.hintColor,
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
    );
  }
}