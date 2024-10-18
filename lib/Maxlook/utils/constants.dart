import 'package:flutter/material.dart';

const Color darkColor = Color(0xFF2B2929);
const Color orangeColor = Color(0xFFF56030);
const Color orangeGradientColor = Color(0xFFFFE8E1);
const Color lightColor = Colors.white;
const Color lightGreyColor = Color(0xFFE0DEDE);

const double minPadding = 24.0;

const double minBorderRadius = 20.0;
const double cardBorderRadius = 18.0;

class Conststants {
  BuildContext context;
  Conststants({required this.context});

  // final double minTabletWidth = 768;

  double fullWidth() => MediaQuery.maybeOf(context)!.size.width;
  double fullHeight() => MediaQuery.maybeOf(context)!.size.height;

  double oneWidthBlock() => fullWidth() / 100;
  double oneHeightBlock() => fullHeight() / 100;

  // double lineWidth() => fullWidth() * 0.2;

  // double horizontalPadding() => oneWidthBlock() * 4;

  // double maxBoxConstraintsWidth = 940;
  // bool isTabletWidth() => fullWidth() >= _bigWidthScreen;
  // bool isTabletHeight() => fullHeight() >= _bigHightScreen;
}
