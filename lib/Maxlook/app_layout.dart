import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test3/Maxlook/providers/products_provider.dart';
import 'package:test3/Maxlook/screens/home.dart';
import 'package:test3/Maxlook/screens/product_datails.dart';
import 'package:test3/Maxlook/utils/constants.dart';

import 'providers/consts_provider.dart';

class AppLayout extends StatelessWidget {
  static String id = 'AppLayout';
  AppLayout({Key? key}) : super(key: key);
  late Conststants _conststants;
  late ProductsProvider _productsProvider;

  @override
  Widget build(BuildContext context) {
    _productsProvider = Provider.of<ProductsProvider>(context);
    _conststants = Conststants(context: context);

    print(_conststants.fullWidth());
    return _productsProvider.isTablet(_conststants.fullWidth()) &&
            _productsProvider.getSelectedProduct != null
        ? Row(
            children: [
              Expanded(child: MaxlookHome()),
              Expanded(child: ProductDetails()),
            ],
          )
        : MaxlookHome();
  }
}
