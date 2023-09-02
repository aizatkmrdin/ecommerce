import 'package:hive/hive.dart';

class DBContainer {
  static Box getCart() => Hive.box('cart_box');
}
