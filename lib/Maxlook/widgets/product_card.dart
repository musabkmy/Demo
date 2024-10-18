// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test3/Maxlook/models/prdouct.dart';
import 'package:test3/Maxlook/providers/consts_provider.dart';
import 'package:test3/Maxlook/providers/products_provider.dart';
import 'package:test3/Maxlook/shared/shared_funtions.dart';
import 'package:test3/Maxlook/shared/shared_layouts.dart';

import '../screens/product_datails.dart';
import '../utils/constants.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  ProductCard(this.product, {Key? key}) : super(key: key);

  late final Product product;
  // late final bool isSecondLine;
  late final Conststants conststants;
  late ProductsProvider _productsProvider;
  // late ConstsProvider _constsProvider;

  @override
  Widget build(BuildContext context) {
    conststants = Conststants(context: context);
    _productsProvider = Provider.of<ProductsProvider>(context, listen: false);
    // _constsProvider = Provider.of<ConstsProvider>(context);

    return SafeArea(
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            _productsProvider.setSelectedProduct = product.id;
            if (!_productsProvider.isTablet(conststants.fullWidth()))
              Navigator.of(context).pushNamed(ProductDetails.id);
          },
          child: Container(
            width: conststants.fullWidth() / 2,
            // height: conststants.fullWidth() * 1.5,
            margin: EdgeInsets.symmetric(horizontal: minPadding / 2),
            // .copyWith(
            //     top: isSecondLine ? 0 : conststants.fullHeight() * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageLayout(
                  productId: product.id,
                  imageUrl: product.forms[0].mainImage,
                  height: 260,
                  verticalPadding: minPadding / 2,
                  // isFav: product.isFav,
                  bigPadding: true,
                  withBorder:
                      _productsProvider.getSelectedProduct?.id == product.id &&
                          _productsProvider.isTablet(conststants.fullWidth()),
                ),
                SizedBox(
                  width: conststants.fullWidth() / 2 - minPadding,
                  child: Text(product.name.toTitleCase(),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                Text('\$${product.price}',
                    style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
          ),
        );
      }),
    );
  }
}
