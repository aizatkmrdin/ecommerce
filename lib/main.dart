import 'package:ecommerce/controllers/categories_list.dart';
import 'package:ecommerce/controllers/pagination.dart';
import 'package:ecommerce/controllers/product_detail.dart';
import 'package:ecommerce/controllers/product_list.dart';
import 'package:ecommerce/controllers/searching_list.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ProductList>(create: (_) => ProductList()),
      ChangeNotifierProvider<Pagination>(create: (_) => Pagination()),
      ChangeNotifierProvider<SearchingList>(create: (_) => SearchingList()),
      ChangeNotifierProvider<ProductDetail>(create: (_) => ProductDetail()),
    ], child: MaterialApp(debugShowCheckedModeBanner: false, title: 'Ecommerce', home: const HomePage()));
  }
}
