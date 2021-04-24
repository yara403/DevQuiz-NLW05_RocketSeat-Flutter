import 'package:flutter/material.dart';

class ChallengeController {
  var currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;
  int answerRight = 0;
}
