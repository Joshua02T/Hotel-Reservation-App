import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

BoxDecoration customBoxDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [orangeGradient, Colors.white]));
}
