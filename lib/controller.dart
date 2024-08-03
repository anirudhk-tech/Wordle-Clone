import 'package:word_generator/word_generator.dart';
import 'package:get/get.dart';


class WordController extends GetxController {
  final gen = WordGenerator();
  var word = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchWord();
  }

  void fetchWord() {
    while (word.value.isEmpty || word.value.length > 7) {
      word.value = gen.randomNoun();
    }
  }

  void nextWord() {
    var fetchedWord = gen.randomNoun();

    if (fetchedWord.length > 7) {
      while (fetchedWord.length > 7) {
        fetchedWord = gen.randomNoun();
      }
    }
    
    word.value = fetchedWord; 
  }
}



