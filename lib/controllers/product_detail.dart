import 'package:flutter/material.dart';

class ProductDetail extends ChangeNotifier {
  int activePage = 0;
  int get getActivePage => activePage;
  set ActivePage(int index) {
    activePage = index;
    notifyListeners();
  }
}
