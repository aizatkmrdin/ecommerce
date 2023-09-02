import 'package:ecommerce/models/catogories.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';

class ProductList extends ChangeNotifier {
  List<ProductElement> items = [];

  void addItem(product) {
    items.add(product);
    notifyListeners();
  }

  List<ProductElement> get productItem {
    return items;
  }
}
