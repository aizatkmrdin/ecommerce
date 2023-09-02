import 'dart:convert';

import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/models/catogories.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/widgets/snakcbars.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<ProductElement>?> getListProduct(BuildContext context, int skip) async {
    try {
      var url = ApiConstants.baseUrl + ApiConstants.getProductsEndpoint + ApiConstants.limitPagination + (skip == 0 ? '' : '&skip=$skip');
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "Application/json",
        },
      );
      switch (response.statusCode) {
        case 200:
          Product listProduct = Product.fromJson(jsonDecode(response.body));
          return listProduct.products;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      showInSnackBarFail(e.toString(), context);
    }
    return null;
  }

  Future<List<ProductElement>?> getValueBySearch(BuildContext context, String searchValue) async {
    try {
      var url = ApiConstants.baseUrl + ApiConstants.searchProductEndpoints + searchValue;
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "Application/json",
        },
      );
      switch (response.statusCode) {
        case 200:
          Product listProduct = Product.fromJson(jsonDecode(response.body));
          return listProduct.products;
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
      var url = ApiConstants.baseUrl + ApiConstants.getCategoriesEndpoint;
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "Application/json",
        },
      );
      switch (response.statusCode) {
        case 200:
          List listCategories = List.from(json.decode(response.body).map((x) => x));

          return listCategories;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      showInSnackBarFail(e.toString(), context);
    }
  }
}
