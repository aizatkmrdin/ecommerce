import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';

class SearchingList extends ChangeNotifier {
  List<ProductElement> items = [];

  void addItem(product) {
    items.add(product);
    notifyListeners();
  }

  List<ProductElement> get searchingItem {
    return items;
  }
}
