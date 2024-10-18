import '../utils/enums.dart';

class ProductForm {
  ProductForm(
      {required this.formId,
      required this.size,
      required this.formThumbImage,
      required this.mainImage,
      required this.detailsMainPic,
      required this.detailsSubPics,
      this.isNew = false});
  final String formId;
  final List<ProductSize> size;
  final String formThumbImage;
  String mainImage;
  String detailsMainPic;
  List<String> detailsSubPics;
  bool isNew;
}
