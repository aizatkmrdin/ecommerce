import 'package:ecommerce/controllers/searching_list.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/providers/api.dart';
import 'package:ecommerce/widgets/listing_card.dart';
import 'package:ecommerce/widgets/snakcbars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchListPage extends StatefulWidget {
  SearchListPage({super.key, required this.searchingValue});

  String searchingValue;

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Searching',
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: ApiServices().getValueBySearch(context, widget.searchingValue),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            default:
              if (snapshot.hasError) {
                showInSnackBarFail('Error: ${snapshot.error}', context);
                return Text('Error: ${snapshot.error}');
              } else {
                List<ProductElement>? tempListProduct = snapshot.data;
                // print(tempListProduct!.length);
                return tempListProduct!.isEmpty
                    ? Center(
                        child: Text(
                          'No result found',
                          style: GoogleFonts.montserrat(color: Colors.black),
                        ),
                      )
                    : Column(children: [
                        ...List.generate(
                            tempListProduct.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListingCard(product: tempListProduct[index]),
                                ))
                      ]);
              }
          }
        },
      ),

      // widget.searchingList!.isEmpty
      //     ? Center(
      //         child: Text(
      //           'No result found',
      //           style: GoogleFonts.montserrat(color: Colors.black),
      //         ),
      //       )
      //     : Column(children: [
      //         ...List.generate(
      //             widget.searchingList!.length,
      //             (index) => Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: ListingCard(title: widget.searchingList![index].title, fileID: ' x', date: ' '),
      //                 ))
      //       ]),
    );
  }
}
