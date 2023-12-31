import 'dart:convert';

class Categories {
  String title;
  Categories({required this.title});

  List<String> categoriesFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

  String categoriesToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
}
