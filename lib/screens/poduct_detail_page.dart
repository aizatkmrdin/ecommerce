import 'package:ecommerce/controllers/product_detail.dart';
import 'package:ecommerce/controllers/searching_list.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/providers/api.dart';
import 'package:ecommerce/utilities/notification_services.dart';
import 'package:ecommerce/utilities/services.dart';
import 'package:ecommerce/widgets/button.dart';
import 'package:ecommerce/widgets/listing_card.dart';
import 'package:ecommerce/widgets/snakcbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({super.key, required this.product});

  ProductElement product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final cartBox = Hive.box('cart_box');
  final PageController pageController = PageController();

  Future<void> createCart(Map<String, dynamic> newCart) async {
    await cartBox.add(newCart);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductDetail>(builder: (context, productDetail, child) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              pinned: true,
              snap: false,
              floating: true,
              backgroundColor: Colors.transparent,
              expandedHeight: MediaQuery.of(context).size.height,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                          itemCount: widget.product.images.length,
                          controller: pageController,
                          onPageChanged: (page) {
                            productDetail.ActivePage = page;
                          },
                          itemBuilder: (context, int index) {
                            return Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * .4,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey.shade300,
                                  child: Image.network(widget.product.images[index], fit: BoxFit.fill),
                                ),
                                // Positioned(child: Icon())
                                Positioned(
                                    bottom: 30,
                                    right: 0,
                                    left: 0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ...List.generate(
                                            widget.product.images.length,
                                            (index) => Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                                  child: CircleAvatar(
                                                    radius: 5,
                                                    backgroundColor: productDetail.activePage != index ? Colors.grey : Colors.black,
                                                  ),
                                                ))
                                      ],
                                    )),
                              ],
                            );
                          }),
                    ),
                    Positioned(
                        bottom: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .6,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(
                                    widget.product.title,
                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 36),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        widget.product.brand,
                                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey),
                                      ),
                                      SizedBox(width: 20),
                                      Row(
                                        children: [
                                          Text(
                                            '${widget.product.rating}',
                                            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 15),
                                          ),
                                          const Icon(
                                            Iconsax.star1,
                                            color: Colors.amberAccent,
                                            size: 17,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${getDiscountPrice(widget.product.discountPercentage, widget.product.price)}',
                                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 21),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      if (widget.product.discountPercentage != null)
                                        Text(
                                          '\$${widget.product.price}',
                                          style: GoogleFonts.montserrat(decoration: TextDecoration.lineThrough, color: Colors.grey),
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${widget.product.description}',
                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 200),
                                        child: InkWell(
                                          onTap: () async {
                                            var prices = getDiscountPrice(widget.product.discountPercentage, widget.product.price);
                                            createCart({
                                              'id': widget.product.id,
                                              'title': widget.product.title,
                                              'category': widget.product.category,
                                              'qty': 1,
                                              'img': widget.product.thumbnail,
                                              'prices': prices,
                                            });
                                            var status = await Permission.notification.status;
                                            if (status.isDenied) {
                                              showInSnackBarFail('Please Enable Notification In Settings', context);
                                            }
                                            NotificationService()
                                                .showNotification(title: 'Sucessfully Add to Card', body: '${widget.product.title} add to card');
                                            Navigator.pop(context);
                                          },
                                          child: BgButton(
                                            title: 'Add to Cart',
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            )))
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
