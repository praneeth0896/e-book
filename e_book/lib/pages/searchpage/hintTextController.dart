import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HintTextController extends GetxController with SingleGetTickerProviderMixin {
  var hintText = ''.obs;
  var hintTexts = <String>['Suspense', 'Drama', 'Romance', 'Education','Autobiography'].obs;

  late AnimationController _animationController;
  late Animation<double> _tweenAnimation;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void onInit() {
    super.onInit();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _tweenAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    hintText.value = hintTexts[_currentIndex];
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      _updateHintText();
    });
  }

  void _updateHintText() {
    _animationController.forward(from: 0.0).then((_) {
      _currentIndex = (_currentIndex + 1) % hintTexts.length;

      hintText.value = hintTexts[_currentIndex];

      _animationController.reset();
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    _animationController.dispose();
    super.onClose();
  }

  Animation<double> get tweenAnimation => _tweenAnimation;
}
