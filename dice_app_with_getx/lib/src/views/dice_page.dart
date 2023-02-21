import 'package:dice_app_with_getx/src/controller/dice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DicePage extends StatelessWidget {
  DicePage({super.key});
  final controller = Get.put(DiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF5353),
      appBar: AppBar(
        title: const Text(
          'ТАПШЫРМА-05',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffFF5353),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Row(
                children: [
                  ImageButton(
                    controller: controller,
                    onTap: controller.baskanda,
                    text: '${controller.leftDice.value}',
                  ),
                  ImageButton(
                    controller: controller,
                    onTap: controller.baskanda,
                    text: '${controller.rightDice.value}',
                  ),
                ],
              );
            }),
            InkWell(
              onTap: controller.baskanda,
              child: const Icon(
                Icons.refresh,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key,
    required this.controller,
    this.onTap,
    required this.text,
  }) : super(key: key);

  final void Function()? onTap;
  final String text;

  final DiceController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Image.asset(
          'assets/images/dice$text.png',
        ),
      ),
    ));
  }
}
