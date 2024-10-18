import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test3/Maxlook/providers/products_provider.dart';
import 'package:test3/Maxlook/shared/shared_funtions.dart';
import 'package:test3/Maxlook/shared/shared_layouts.dart';
import 'package:test3/Maxlook/utils/enums.dart';

import '../models/prdouct.dart';
import '../utils/constants.dart';

class CartPage extends StatelessWidget {
  static String id = 'CartPage';
  late ProductsProvider _productsProvider;
  late Conststants _conststants;

  late Product? _selectedProduct;
  @override
  Widget build(BuildContext context) {
    _conststants = Conststants(context: context);
    _productsProvider = Provider.of<ProductsProvider>(context);
    _selectedProduct = _productsProvider.getSelectedProduct;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: minPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(-6, 0),
            // begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [orangeGradientColor, lightColor]),
      ),
      child: Scaffold(
        appBar: MaxlookAppBar(context,
            title: 'Cart',
            withLeading: !_productsProvider.isTablet(_conststants.fullWidth())),
        body: _selectedProduct == null ? SizedBox() : CartBody(),
      ),
    );
  }
}

class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  late Conststants _conststants;
  late Product? _selectedProduct;
  @override
  Widget build(BuildContext context) {
    _conststants = Conststants(context: context);
    return Consumer<ProductsProvider>(
      builder: (context, productsprovider, child) {
        _selectedProduct = productsprovider.getSelectedProduct!;
        return Container(
          height: _conststants.fullHeight() / 3,
          padding: const EdgeInsets.only(top: minPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text.rich(
                      TextSpan(
                          text: _sizeFromEnumToString(
                              _selectedProduct!.orderProductSize),
                          style: Theme.of(context).textTheme.labelSmall,
                          children: [
                            TextSpan(
                              text: '\n' + _selectedProduct!.name.toTitleCase(),
                              style: Theme.of(context).textTheme.bodyMedium,
                              // textAlign: TextAlign.justify,
                            ),
                          ]),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  // ),
                  IconButton(
                    onPressed: () {},
                    icon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.trash_circle_fill,
                        size: 32.0,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: minPadding / 2),
              ProductImageLayout(
                  productId: _selectedProduct!.id,
                  imageUrl: _selectedProduct!.forms[0].mainImage,
                  height: _conststants.fullHeight() / 5.5,
                  noFav: true,
                  verticalPadding: 0.0),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${_selectedProduct!.price}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Container(
                          // alignment: AlignmentDirectional.centerEnd,
                          // margin: EdgeInsets.only(top: minPadding / 2),
                          width: _conststants.fullWidth() / 4,
                          child: OrderQuantity()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _sizeFromEnumToString(ProductSize size) {
    switch (size) {
      case ProductSize.s:
        return 'Small';
      case ProductSize.m:
        return 'Medium';
      case ProductSize.l:
        return 'Large';
      case ProductSize.xl:
        return 'X Large';
      case ProductSize.xxl:
        return 'XX Large';
      case ProductSize.xxxl:
        return 'XXX Large';

      default:
        return '';
    }
  }
}


          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Flexible(
          //       child: ProductImageLayout(
          //           productId: _selectedProduct!.id,
          //           imageUrl: _selectedProduct!.forms[0].mainImage,
          //           height: 280,
          //           noFav: true,
          //           verticalPadding: 0.0),
          //     ),
          //     Flexible(
          //       child: Padding(
          //         padding: EdgeInsetsDirectional.only(start: minPadding),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Flexible(
          //                 child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(
          //                     _sizeFromEnumToString(
          //                         _selectedProduct!.orderProductSize),
          //                     style: Theme.of(context).textTheme.titleMedium),
          //                 IconButton(
          //                   onPressed: () {},
          //                   icon: GestureDetector(
          //                     onTap: () {},
          //                     child: Icon(
          //                       CupertinoIcons.trash_circle_fill,
          //                       size: 28.0,
          //                       color: Colors.red,
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             )),
          //             Flexible(
          //               child: Text(
          //                 _selectedProduct!.name.toTitleCase(),
          //                 style: Theme.of(context).textTheme.bodyMedium,
          //                 // textAlign: TextAlign.justify,
          //               ),
          //             ),
          //             SizedBox(height: minPadding),
          //             Flexible(
          //               child: Align(
          //                 alignment: AlignmentDirectional.centerStart,
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       '\$${_selectedProduct!.price}',
          //                       style: Theme.of(context).textTheme.bodyLarge,
          //                     ),
          //                     Container(
          //                         // alignment: AlignmentDirectional.centerEnd,
          //                         // margin: EdgeInsets.only(top: minPadding / 2),
          //                         width: _conststants.fullWidth() / 4,
          //                         child: OrderQuantity()),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ], required ${1|MainAxisAlignment,Enum,Object|} mainAxisAlignment, required ${1|MainAxisAlignment,Enum,Object|} mainAxisAlignment,
          // ),
        
