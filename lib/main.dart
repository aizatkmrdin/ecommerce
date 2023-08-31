import 'package:ecommerce/controllers/categories_list.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      home: MultiProvider(providers: [ChangeNotifierProvider<CategoriesList>(create: (_) => CategoriesList())], child: const HomePage()),
    );
  }
}
