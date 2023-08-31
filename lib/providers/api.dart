import 'dart:convert';

import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/widgets/snakcbars.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<ProductElement>?> getListCurrentFile(BuildContext context) async {
    try {
      var url = ApiConstants.baseUrl + ApiConstants.getProductsEndpoint;
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "Application/json",
        },
      );
      switch (response.statusCode) {
        case 200:
          Product listCurrentFiles = Product.fromJson(jsonDecode(response.body));
          return listCurrentFiles.products;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      showInSnackBarFail(e.toString(), context);
    }
    return null;
  }

  Future<ProductElement?> getValueBySearch(BuildContext context) async {
    try {
      var url = ApiConstants.baseUrl + ApiConstants.getProductsEndpoint;
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "Application/json",
        },
      );
      switch (response.statusCode) {
        case 200:
          ProductElement listCurrentFiles = ProductElement.fromJson(jsonDecode(response.body));
          return listCurrentFiles;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      showInSnackBarFail(e.toString(), context);
    }
    return null;
  }

  Future<List?> getListCategories(BuildContext context) async {
    try {
      var url = ApiConstants.baseUrl + ApiConstants.getProductsEndpoint;
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "Application/json",
        },
      );
      switch (response.statusCode) {
        case 200:
          List listCategories = jsonDecode(response.body).toList();
          return listCategories;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      showInSnackBarFail(e.toString(), context);
    }
    return null;
  }
}
