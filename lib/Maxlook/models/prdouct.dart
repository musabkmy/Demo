import 'package:test3/Maxlook/utils/enums.dart';

import 'product_form.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.forms,
    required this.mainFormId,
    required this.producedSizes,
    required this.price,
    required this.gender,
    required this.type,
    required this.description,
    this.overallRating = -1,
    this.isNew = false,
    this.isPopular = false,
    required this.hasShortage,
    required this.maxQuantityToOrder,
    this.isFav = false,
  });

  final String id;
  final String name;
  List<ProductForm> forms = [];
  String mainFormId;
  List<ProductSize> producedSizes = [];
  final double price;
  final ProductGender gender;
  final ProductType type;
  String description;
  double overallRating;
  bool isNew;
  bool isPopular;
  //ordering related
  bool hasShortage;
  int maxQuantityToOrder; //must be < quantityAvailable
  late int orderQuantity;
  late double orderPrice;
  late ProductSize orderProductSize = ProductSize.undefiend;
  //user action
  bool isFav;
  //isPurchedBefore;
  //rating;
}
