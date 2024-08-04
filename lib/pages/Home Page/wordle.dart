import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wordpair/controller.dart';
import 'package:wordpair/widgets/Home Page/word_square.dart';
import 'package:wordpair/theme.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({super.key});

  @override
  Widget build (BuildContext context) {
  
  final controller = Get.find<WordController>();
  var word = controller.word;
  
    return Container (
      color: ThemeContext.wordleTheme.secondaryHeaderColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: ThemeContext.wordleTheme.secondaryHeaderColor,
            child: Obx(() => Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var x = 0; x < word.value.length; x++) (
                  Row(
                    children: [
                      const SizedBox(width: 10,),
                      WordSquare(
                        letter: word.value[x], 
                        color: ThemeContext.wordleTheme.primaryColor,
                      ),
                      const SizedBox(width: 10,),
                    ],
                  )
                )
              ],
            ))
          ),
          const SizedBox(height: 20,),
          Center(
            child: ElevatedButton(
              onPressed: controller.nextWord,
              style: ButtonStyle (
                backgroundColor: WidgetStateProperty.all<Color>(ThemeContext.wordleTheme.hintColor),
              ),
              child: Text(
                "Next",
                style: ThemeContext.wordleTheme.textTheme.labelLarge,
                ),
              )
            )
        ]
      )
    );
  }
}