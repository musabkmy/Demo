import 'package:flutter/foundation.dart';
import 'package:test3/Maxlook/utils/enums.dart';

import '../data/data.dart';
import '../models/prdouct.dart';

class ProductsProvider with ChangeNotifier {
  static const double _minTabletWidth = 768;

  Product? _selectedProduct;

  List<Product> _allProducts = productsData;

  bool isTablet(double screenWidth) {
    return screenWidth >= _minTabletWidth;
  }

  void set setSelectedProduct(String id) {
    int _selectedIndex = _allProducts.indexWhere((item) => item.id == id);
    if (_selectedIndex != -1) {
      _selectedProduct = _allProducts[_selectedIndex];
    }
    notifyListeners();
  }

  Product? get getSelectedProduct {
    return _selectedProduct;
  }

  void setSelectedProductOrderSize(ProductSize size, {bool withNotify = true}) {
    if (_selectedProduct == null)
      return;
    else {
      _selectedProduct!.orderProductSize = size;
      if (withNotify) notifyListeners();
    }
  }

  ProductSize? get getSelectedProductOrderSize {
    return _selectedProduct?.orderProductSize;
  }

  void setProductIsFav(String productId) {
    int _productIndex =
        _allProducts.indexWhere((element) => element.id == productId);
    if (_productIndex != -1) {
      _allProducts[_productIndex].isFav = !_allProducts[_productIndex].isFav;
      notifyListeners();
    }
  }

  bool getProductIsFav(String productId) {
    int _productIndex =
        _allProducts.indexWhere((element) => element.id == productId);
    if (_productIndex != -1) {
      return _allProducts[_productIndex].isFav;
    }
    return false;
  }
}
