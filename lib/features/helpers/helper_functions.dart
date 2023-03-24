import 'package:flutter/material.dart';

class HelperFunctions {
  static String capitalistFirstLetter(String name) {
    String data = name.replaceRange(0, 1, name[0].toUpperCase());
    return data;
  }

  static double getWidth(BuildContext context, GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final double width = size.width;
    return width;
  }
}
