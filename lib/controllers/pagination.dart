import 'package:flutter/material.dart';

class Pagination extends ChangeNotifier {
  int paginationValue = 0;

  void addItem() {
    paginationValue = paginationValue + 10;
    notifyListeners();
  }

  int get categoriesItem {
    return paginationValue;
  }
}
