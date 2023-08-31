import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

showInSnackBarFail(String value, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 21,
            height: 21,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: const Icon(
              LineariconsFree.cross,
              size: 18,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(30.0),
  ));
}

showInSnackBarSuccess(String value, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 21,
            height: 21,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            child: const Icon(
              Icons.done,
              size: 18,
            ),
          ),
        ),
        Flexible(
          child: Text(
            maxLines: 6,
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(30.0),
  ));
}
