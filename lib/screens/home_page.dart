import 'package:ecommerce/controllers/categories_list.dart';
import 'package:ecommerce/controllers/pagination.dart';
import 'package:ecommerce/controllers/product_list.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/providers/api.dart';
import 'package:ecommerce/screens/cart_page.dart';
import 'package:ecommerce/screens/poduct_detail_page.dart';
import 'package:ecommerce/screens/search_list_page.dart';
import 'package:ecommerce/widgets/button.dart';
import 'package:ecommerce/widgets/listing_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final scrollController = ScrollController();
  bool isCompleted = false;
  // List<ProductElement>? listOfProduct = [];

  // void getCategories() async {
  //   categories = (await ApiServices().getListCategories(context))!;
  //   categories.map((e) => context.read<CategoriesList>().addItem(e)).toList();
  //   // context.read<CategoriesList>().addItem('asd');
  // }

  Future getListOfProduct() async {
    int currentPagination = context.read<Pagination>().paginationValue;
    List<ProductElement>? tempListProduct = await ApiServices().getListProduct(context, currentPagination);
    tempListProduct!.map((e) => context.read<ProductList>().addItem(e)).toList();
    context.read<Pagination>().addItem();
    if (tempListProduct.length < currentPagination) {
      setState(() {
        isCompleted = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        getListOfProduct();
      }
    });
    getListOfProduct();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductElement>? listOfProduct = context.read<ProductList>().productItem;
    return Consumer<ProductList>(
      builder: (context, value, child) => Consumer<Pagination>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Padding for safe area
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi.\nPERRYCOMO',
                    style: GoogleFonts.montserrat(color: Colors.blueGrey, fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      child: Icon(Icons.trolley),
                    ),
                  ),
                ],
              ),
              // Padding
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                StatefulBuilder(builder: (context, setModel) {
                                  return Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(14),
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                                child:
                                                    Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                                                  SizedBox(
                                                    height: MediaQuery.of(context).size.height * .02,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Search Product',
                                                        style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 21),
                                                      ),
                                                      IconButton(
                                                          onPressed: () => Navigator.pop(context),
                                                          icon: const Icon(
                                                            Icons.close,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ),
                                                  const Divider(
                                                    height: 1,
                                                    thickness: 2,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                        child: Text(
                                                          'Searching',
                                                          textAlign: TextAlign.left,
                                                          style: GoogleFonts.poppins(
                                                            textStyle:
                                                                const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          textAlignVertical: TextAlignVertical.center,
                                                          style: const TextStyle(color: Colors.black),
                                                          controller: searchController,
                                                          onChanged: (value) {
                                                            setModel((() {
                                                              setState(() {});
                                                            }));
                                                          },
                                                          decoration: InputDecoration(
                                                            contentPadding: const EdgeInsets.all(15.0),
                                                            fillColor: const Color(0xFFE2E2E2),
                                                            filled: true,
                                                            hintText: 'By name, category or brand',
                                                            suffixIcon: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                                                              mainAxisSize: MainAxisSize.min, // added line
                                                              children: <Widget>[
                                                                searchController.text.isEmpty
                                                                    ? Container()
                                                                    : IconButton(
                                                                        onPressed: () {
                                                                          setModel((() {
                                                                            setState(() {
                                                                              searchController.clear();
                                                                            });
                                                                          }));
                                                                        },
                                                                        icon: const Icon(
                                                                          Iconsax.close_square,
                                                                          color: Colors.black,
                                                                        ),
                                                                      ),
                                                              ],
                                                            ),
                                                            hintStyle: GoogleFonts.hindSiliguri(
                                                                textStyle:
                                                                    const TextStyle(color: Colors.grey, fontSize: 19, fontWeight: FontWeight.w500)),
                                                            focusedBorder: const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0xFFE2E2E2),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius: BorderRadius.all(
                                                                Radius.circular(10),
                                                              ),
                                                            ),
                                                            enabledBorder: const OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                Radius.circular(10),
                                                              ),
                                                              borderSide: BorderSide(
                                                                color: Color(0xFFE2E2E2),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            border: const OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                Radius.circular(10),
                                                              ),
                                                            ),
                                                            prefixIconColor: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  InkResponse(
                                                      onTap: () async {
                                                        // List<ProductElement>? tempListProduct =
                                                        //     await ApiServices().getValueBySearch(context, searchController.text);
                                                        Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (context) => SearchListPage(
                                                                  searchingValue: searchController.text,
                                                                )));
                                                      },
                                                      child: BgButton(title: 'Search')),
                                                  SizedBox(
                                                    height: MediaQuery.of(context).size.width * .02,
                                                  ),
                                                ]))),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          );
                        });
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(color: Colors.black),
                      controller: searchController,
                      enabled: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15.0),
                        prefixIcon: const Icon(
                          Iconsax.search_normal_1,
                          color: Colors.black,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search',
                        hintStyle:
                            GoogleFonts.hindSiliguri(textStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFFE2E2E2),
                            width: 1,
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.5,
                          ),
                        ),
                        prefixIconColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Product',
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: SizedBox(
                  child: GridView.builder(
                      controller: scrollController,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 2 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                      itemCount: listOfProduct.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                      product: listOfProduct[index],
                                    )));
                          },
                          child: ListingCard(
                            product: listOfProduct[index],
                          ),
                        );
                      }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
