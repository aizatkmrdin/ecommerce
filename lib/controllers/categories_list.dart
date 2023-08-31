import 'package:ecommerce/models/catogories.dart';
import 'package:flutter/material.dart';

class CategoriesList extends ChangeNotifier {
  List<Categories> items = [Categories(title: 'All Categories')];

  void addItem(Categories categories) {
    items.add(categories);
    notifyListeners();
  }

  List<Categories> get categoriesItem {
    return items;
  }
}
