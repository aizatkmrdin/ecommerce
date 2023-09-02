import 'package:ecommerce/models/catogories.dart';
import 'package:flutter/material.dart';

class CategoriesList extends ChangeNotifier {
  List items = [];

  void addItem(String val) {
    items.add(val);
    notifyListeners();
  }

  List get categoriesItem {
    return items;
  }
}
