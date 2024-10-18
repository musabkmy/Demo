import 'package:flutter/cupertino.dart';
import 'package:test3/Maxlook/utils/enums.dart';

import '../data/data.dart';
import '../models/prdouct.dart';

bool productsHasMan() {
  return productsData.any((item) => item.gender == ProductGender.men);
}

List<Product> manProducts() {
  return productsData
      .where((element) => element.gender == ProductGender.men)
      .toList();
}

bool productsHasWoman() {
  return productsData.any((item) => item.gender == ProductGender.women);
}

List<Product> womanProducts() {
  return productsData
      .where((element) => element.gender == ProductGender.women)
      .toList();
}

bool productsHasNew() {
  return productsData.any((item) => item.isNew);
}

List<Product> newProducts() {
  return productsData.where((element) => element.isNew == true).toList();
}

bool productsHasPopular() {
  return productsData.any((item) => item.isPopular);
}

List<Product> popularProducts() {
  return productsData.where((element) => element.isPopular == true).toList();
}

int noOfTabsAvailable() {
  int _tabsNumber = 1;
  if (productsHasMan()) _tabsNumber++;
  if (productsHasWoman()) _tabsNumber++;
  if (productsHasPopular()) _tabsNumber++;
  if (productsHasNew()) _tabsNumber++;

  return _tabsNumber;
}

///get different layout color depending on two conditions and active/unactive colors
///declaration ec:
///_selectedProductSize != null
/// ? _selectedProductSize == size
///     ? darkColor
///     : lightColor
/// : lightColor,
Color getRightColor(
    {required bool firstCondition,
    required bool secondCondition,
    required Color activeColor,
    required Color unactiveColor}) {
  return firstCondition
      ? secondCondition
          ? activeColor
          : unactiveColor
      : unactiveColor;
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
