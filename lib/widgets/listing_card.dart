// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/utilities/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ListingCard extends StatelessWidget {
  ListingCard({
    required this.product,
    super.key,
  });

  ProductElement product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFFF1F1F1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(product.thumbnail),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: const Color(0xFFF1F1F1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      child: Row(
                        children: [
                          Text(
                            '${product.rating}',
                            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                          const Icon(
                            Iconsax.star1,
                            color: Colors.amberAccent,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$${getDiscountPrice(product.discountPercentage, product.price)}',
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 21),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        if (product.discountPercentage != null)
                          Text(
                            '\$${product.price}',
                            style: GoogleFonts.montserrat(decoration: TextDecoration.lineThrough, color: Colors.grey),
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
