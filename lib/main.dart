import 'package:flutter/material.dart';
import 'pages/Home Page/wordle.dart';
import 'package:get/get.dart';
import 'controller.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WordController());

    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: WordlePage(),
    );
  }
}
