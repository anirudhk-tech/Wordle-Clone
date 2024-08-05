import 'package:flutter/widgets.dart';
import 'package:word_generator/word_generator.dart';
import 'package:get/get.dart';
import 'package:all_english_words/all_english_words.dart';


class WordController extends GetxController {
  final gen = WordGenerator();
  var word = "".obs;
  var guess = TextEditingController().obs;
  var guessInputFocus = FocusNode();
  var correctLetters = [].obs;
  var englishWords = AllEnglishWords();
  var allWords = [];
  var wrongLetters = [].obs;
  var alertVisible = false.obs;

  @override
  void onInit() async {
    super.onInit();
    // ignore: await_only_futures
    allWords = await englishWords.allWords; 
    fetchWord();
  }

  void fetchWord() {
    while (word.value.isEmpty || word.value.length != 5) {
      word.value = gen.randomNoun();
    }
  }

  void nextWord() {
    var fetchedWord = gen.randomNoun();

    if (fetchedWord.length != 5) {
      while (fetchedWord.length != 5) {
        fetchedWord = gen.randomNoun();
      }
    }

    word.value = fetchedWord; 
    guess.value.text = "";
    correctLetters.value = [];
    wrongLetters.value = [];
    guessInputFocus.requestFocus();
  }

  void showAlert() {
    alertVisible.value = true; 
  }

  void hideAlert() {
    alertVisible.value = false;
  }

  void guessFailed() {
    guess.value.text = "";
    guessInputFocus.requestFocus();
  }

  void guessWord() {
    var guessWord = guess.value.text;

    if (allWords.contains(guessWord) != true) {
      guessFailed();
      showAlert();
      Future.delayed(const Duration(seconds: 2), hideAlert);
      return;
    }

    for (var x = 0; x < guessWord.length; x++) {
      if (word.value.contains(guessWord[x])) {
        addLetter(guessWord[x]);
      } else {
        addWrong(guessWord[x]);
      }
    }

    if (check() == true) {
      Future.delayed(const Duration(seconds: 3), nextWord);
    } else {
      Future.delayed(const Duration(milliseconds: 100), guessFailed);
    }
  }

  void addLetter(letter) {
    correctLetters.value = correctLetters.contains(letter) ? correctLetters : [...correctLetters, letter];
  }

  void addWrong(letter) {
    wrongLetters.contains(letter) ? {} : wrongLetters.add(letter);
    wrongLetters.sort();
  }

  bool check() {
    var count = 0; 

    if (correctLetters.isEmpty) {
      return false;
    };

    for (var x = 0; x < 5; x++) {
      if (correctLetters.contains(guess.value.text[x])) {
        count += 1 * guess.value.text[x].allMatches(word.value).length;
      }
    }

    if (count == 5) {
      return true;
    } else {
      return false;
    }
  }

}



