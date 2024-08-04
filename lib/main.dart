import 'package:flutter/material.dart';
import 'package:wordpair/theme.dart';
import 'pages/Home Page/wordle.dart';
import 'package:get/get.dart';
import 'controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WordController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      home: WordlePage(),
    );
  }
}
