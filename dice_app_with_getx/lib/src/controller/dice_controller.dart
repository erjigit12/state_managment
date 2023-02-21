import 'dart:math';

import 'package:get/get.dart';

class DiceController extends GetxController {
  var leftDice = 3.obs;
  var rightDice = 4.obs;

  void baskanda() {
    leftDice.value = Random().nextInt(6) + 1;
    rightDice.value = Random().nextInt(6) + 1;
  }
}
