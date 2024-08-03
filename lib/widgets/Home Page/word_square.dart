import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpair/controller.dart';


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
        border: Border.all(
          color: Colors.white, 
          width: 1,
        )
      ),
      child: Center(
        child: Text (letter)
      ),
    );
  }
}