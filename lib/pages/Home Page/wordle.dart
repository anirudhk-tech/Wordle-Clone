import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wordpair/controller.dart';
import 'package:wordpair/widgets/Home Page/word_square.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({super.key});

  @override
  Widget build (BuildContext context) {
  
  final controller = Get.find<WordController>();
  var word = controller.word.value;
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Obx(() => Row (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var x = 0; x < word.length; x++) (
                Row(
                  children: [
                    const SizedBox(width: 10,),
                    WordSquare(
                      letter: controller.word.value[x], 
                      color: Colors.black
                    ),
                    const SizedBox(width: 10,),
                  ],
                )
              )
            ],
          ))
        ),
        const SizedBox(height: 100,),
        ElevatedButton(
          onPressed: () {
            controller.nextWord();
          }, 
          child: const Text("Next")
        )
      ]
    );
  }
}