import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

void customNavigate(Widget path) {
  Flexify.go(
    path,
    animation: FlexifyRouteAnimations.slide,
    animationDuration: const Duration(milliseconds: 500),
  );
}

void custompopNavigate(context) {
  Flexify.back();
}

void customReplacementNavigate(Widget path) {
  Flexify.goRemove(
    path,
  animation: FlexifyRouteAnimations.scale,
  duration: const Duration(milliseconds: 500),);
}

void delayedNavigate(context, path) {
  Future.delayed(const Duration(seconds: 2), () {
    customReplacementNavigate(path);
  });
}
