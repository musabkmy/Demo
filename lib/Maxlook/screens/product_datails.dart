import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test3/Maxlook/models/product_form.dart';
import 'package:test3/Maxlook/providers/products_provider.dart';
import 'package:test3/Maxlook/screens/cart.dart';
import 'package:test3/Maxlook/shared/shared_funtions.dart';
import 'package:test3/Maxlook/shared/shared_layouts.dart';
import 'package:test3/Maxlook/utils/enums.dart';

import '../models/prdouct.dart';
import '../utils/constants.dart';

class ProductDetails extends StatelessWidget {
  static String id = 'ProductDetails';

  late Conststants _conststants;
  // late ProductsProvider _productsProvider;
  late Product? _selectedProduct;
  late int _selectedFormIndex;

  // Stream<int> countStream(int max) async* {
  //   for (int i = 0; i < max; i++) {
  //     yield i;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _conststants = Conststants(context: context);
    // _productsProvider = Provider.of<ProductsProvider>(context, listen: false);
    // _selectedProduct = _productsProvider.getSelecxtedProduct;
    return Consumer<ProductsProvider>(
        builder: (context, productsProvider, child) {
      _selectedFormIndex = 0;
      _selectedProduct = productsProvider.getSelectedProduct;

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
              title: 'Details Product',
              withLeading:
                  !productsProvider.isTablet(_conststants.fullWidth())),
          body: _selectedProduct == null
              ? SizedBox()
              : Stack(
                  children: [
                    SingleChildScrollView(
                        child: Column(
                      children: [
                        _productImages(),
                        SizedBox(height: minPadding / 2),
                        _namePriceDesRate(
                            context,
                            _selectedProduct!,
                            (productsProvider.isTablet(_conststants.fullWidth())
                                    ? _conststants.fullWidth() / 4
                                    : _conststants.fullWidth() / 2) -
                                minPadding * 1.5),
                        SizedBox(height: minPadding / 2),
                        Text(_selectedProduct!.description,
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.bodySmall),
                        Divider(height: 28.0, color: Colors.transparent),
                      ],
                    )),
                    _buildActionButtons(context),
                  ],
                ),
        ),
      );
    });
  }

  Widget _productImages() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: minPadding / 2),
      child: Column(
        children: [
          ProductImageLayout(
            productId: _selectedProduct!.id,
            imageUrl:
                _selectedProduct!.forms[_selectedFormIndex].detailsMainPic,
            height: 180,
            verticalPadding: 0,
            // isFav: _selectedProduct.isFav,
          ),
          SizedBox(
            height: minPadding / 2,
          ),
          _selectedProduct!.forms[0].detailsSubPics.length != 2
              ? SizedBox()
              : Row(
                  children: [
                    Flexible(
                      child: ProductImageLayout(
                        productId: _selectedProduct!.id,
                        imageUrl: _selectedProduct!
                            .forms[_selectedFormIndex].detailsSubPics[0],
                        height: 150,
                        width: _conststants.fullWidth() / 2 - minPadding,
                        verticalPadding: 0,
                        // withBorder: true,
                        noFav: true,
                      ),
                    ),
                    SizedBox(
                      width: minPadding / 2,
                    ),
                    Flexible(
                      child: ProductImageLayout(
                        productId: _selectedProduct!.id,
                        imageUrl: _selectedProduct!
                            .forms[_selectedFormIndex].detailsSubPics[1],
                        height: 150,
                        width: _conststants.fullWidth() / 2 - minPadding,
                        verticalPadding: 0,
                        noFav: true,
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }

  Widget _namePriceDesRate(
      BuildContext context, Product selectedProduct, double width) {
    _conststants = Conststants(context: context);
    // print('_conststants.fullWidth(): ${_conststants.fullWidth()}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedProduct.name.toTitleCase(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Theme.of(context).textTheme.headlineMedium,
                textWidthBasis: TextWidthBasis.parent,
              ),
              SizedBox(height: minPadding / 2),
              Container(
                  width: _conststants.fullWidth() / 3,
                  child: _buildRating(context, 5.0)),
              // child: _buildRating(context, selectedProduct.overallRating)),
            ],
          ),
        ),
        Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              selectedProduct.isPopular
                  ? Text(
                      'Best Seller',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: orangeColor),
                    )
                  : SizedBox(height: minPadding),
              Text(
                '\$${selectedProduct.price}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                  margin: EdgeInsets.only(top: minPadding / 2),
                  width: width / 2,
                  child: OrderQuantity()),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRating(BuildContext context, double tempOverallRating) {
    List<Widget> _allRatingStars = [];
    double overallRating = tempOverallRating;
    bool inDecm;
    bool aStar;
    for (int i = 1; i <= 5; i++) {
      aStar = overallRating.toInt() >= 1;
      inDecm = overallRating.toInt() == 0 && overallRating >= 0.1;
      // print('$inDecm');
      _allRatingStars.add(_starIcon((aStar), (inDecm)));
      if (inDecm) overallRating = overallRating.floorToDouble();
      if (aStar) overallRating = overallRating - 1;
    }
    _allRatingStars.add(SizedBox(width: minPadding / 2));
    _allRatingStars.add(
      Text(tempOverallRating.toString(),
          style: Theme.of(context).textTheme.titleMedium),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _allRatingStars,
    );
  }

  Icon _starIcon(bool isFilled, bool isHalf) {
    return Icon(
      isFilled
          ? CupertinoIcons.star_fill
          : isHalf
              ? CupertinoIcons.star_lefthalf_fill
              : CupertinoIcons.star,
      size: 18.0,
      color: orangeColor,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: minPadding),
      child: ButtonBar(
        buttonMinWidth: double.maxFinite,
        children: [
          _buildSizeSelection(),
          _buildAddButton(),
        ],
      ),
    );
  }
}

class _buildSizeSelection extends StatefulWidget {
  _buildSizeSelection({
    super.key,
  });

  @override
  State<_buildSizeSelection> createState() => _buildSizeSelectionState();
}

class _buildSizeSelectionState extends State<_buildSizeSelection> {
  late Product _selectedProduct;
  late int _selectedFormIndex;
  late List<ProductSize> _allSizes;
  late List<ProductForm> _productForms;
  late Conststants _conststants;

  late int _selectedIndex = 0;
  ProductSize? _selectedProductSize;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // dependOnInheritedWidgetOfExactType();
    Provider.of<ProductsProvider>(context, listen: false)
        .setSelectedProductOrderSize(ProductSize.undefiend, withNotify: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, productsProvider, child) {
        _selectedProduct = productsProvider.getSelectedProduct!;
        _selectedFormIndex = 0;
        _allSizes = _selectedProduct.producedSizes;
        _productForms = _selectedProduct.forms;
        _conststants = Conststants(context: context);
        _selectedProductSize = productsProvider.getSelectedProductOrderSize;
        return Container(
          alignment: AlignmentDirectional.centerStart,
          height: 50,
          // height: _conststants.fullHeight() * 0.05,
          margin: EdgeInsets.only(bottom: minPadding / 2),

          // width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: ProductSize.values.map((size) {
              return (_allSizes.contains(size))
                  ? Container(
                      height: 70,
                      width: 70,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2.0),
                      // margin: EdgeInsets.only(bottom: minPadding / 2),
                      decoration: new BoxDecoration(
                        color: getRightColor(
                            firstCondition: _selectedProductSize != null,
                            secondCondition: _selectedProductSize == size,
                            activeColor: darkColor,
                            unactiveColor: lightColor),
                        shape: BoxShape.circle,
                        border: Border.all(color: lightGreyColor, width: 1.0),
                      ),
                      child: TextButton(
                        // shape: Border.all(),
                        // selectedTileColor: darkColor,
                        onPressed: () {
                          print(size);
                          productsProvider.setSelectedProductOrderSize(size);
                          // _selectedIndex = as int;
                        },
                        child: Text(size.name.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: getRightColor(
                                      firstCondition:
                                          _selectedProductSize != null,
                                      secondCondition:
                                          _selectedProductSize == size,
                                      activeColor: lightColor,
                                      unactiveColor: darkColor),
                                )),
                      ),
                    )
                  : SizedBox();
            }).toList(),
          ),
        );
      },
    );
  }
}

class _buildAddButton extends StatelessWidget {
  _buildAddButton({
    super.key,
  });
  late Product _selectedProduct;
  ProductSize? _selectedProductSize;
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
        builder: (context, productsProvider, child) {
      _selectedProduct = productsProvider.getSelectedProduct!;
      _selectedProductSize = productsProvider.getSelectedProductOrderSize!;
      return Container(
        height: 55.0,
        width: double.maxFinite,
        child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStatePropertyAll(
                      _selectedProductSize != ProductSize.undefiend
                          ? orangeColor
                          : lightGreyColor),
                  // elevation: MaterialStatePropertyAll(
                  //     _selectedProductSize != ProductSize.undefiend ? 2.0 : 0)
                ),
            onPressed: _selectedProductSize != ProductSize.undefiend
                ? () {
                    Navigator.pushNamed(context, CartPage.id);
                  }
                : () {
                    print('unclickable!');
                  },
            child: Text(
              _selectedProductSize != ProductSize.undefiend
                  ? 'Add to Cart'
                  : 'Pick your size first!',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: _selectedProductSize != ProductSize.undefiend
                        ? lightColor
                        : darkColor,
                  ),
            )),
      );
    });
  }
}
