import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test3/Maxlook/providers/products_provider.dart';

import '../utils/constants.dart';

AppBar MaxlookAppBar(BuildContext context,
    {required String title, required bool withLeading}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: withLeading
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.arrow_left))
        : SizedBox(),
    title: Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz_rounded),
      )
    ],
  );
}

class ProductImageLayout extends StatelessWidget {
  ProductImageLayout({
    Key? key,
    required this.productId,
    required this.imageUrl,
    required this.height,
    this.width = double.maxFinite,
    required this.verticalPadding,
    // this.isFav,
    this.withBorder = false,
    this.bigPadding = false,
    this.noFav = false,
  }) : super(key: key);

  late ProductsProvider productsProvider;
  late String productId;
  late String imageUrl;
  late double height;
  late double width;
  late double verticalPadding;
  late bool? isFav;
  late bool noFav;
  late bool withBorder;
  late bool bigPadding;

  @override
  Widget build(BuildContext context) {
    productsProvider = Provider.of<ProductsProvider>(context);
    isFav = productsProvider.getProductIsFav(productId);
    return Stack(
      children: [
        Container(
          height: height,
          width: double.maxFinite,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: verticalPadding),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(cardBorderRadius + 1.5)),
              border: withBorder
                  ? Border.all(color: orangeColor, width: 3.0)
                  : null),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(cardBorderRadius)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: width,
              )),
        ),
        noFav
            ? SizedBox()
            : Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  height: 32,
                  width: 32,
                  alignment: Alignment.centerLeft,
                  // padding: EdgeInsets.only(bottom: 2),
                  margin: bigPadding
                      ? EdgeInsets.symmetric(vertical: verticalPadding)
                          .copyWith(top: minPadding, right: minPadding / 2)
                      : EdgeInsets.only(
                          top: minPadding / 2, right: minPadding / 2),
                  decoration: BoxDecoration(
                    //color: lightColor,
                    color: isFav! ? orangeColor : lightColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      // alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        productsProvider.setProductIsFav(productId);
                      },
                      icon: Icon(
                        isFav!
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: isFav! ? lightColor : orangeColor,
                        size: 20,
                      )),
                ),
              ),
      ],
    );
  }
}

class OrderQuantity extends StatelessWidget {
  const OrderQuantity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int _quantity = 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            CupertinoIcons.minus_circle_fill,
            size: 28.0,
            color: lightGreyColor,
          ),
        ),
        Text(
          _quantity.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(
            CupertinoIcons.plus_circle_fill,
            size: 28.0,
            color: lightGreyColor,
          ),
        ),
      ],
    );
  }
}
