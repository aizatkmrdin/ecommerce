import 'package:ecommerce/utilities/db_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final cartBox = Hive.box('cart_box');
  deleteCart(int index) async {
    await cartBox.deleteAt(index);
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
          'Cart',
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .65,
            child: ValueListenableBuilder(
                valueListenable: DBContainer.getCart().listenable(),
                builder: (context, box, _) {
                  final cartBox = box.values.toList().cast();
                  // print(listOfToDo[0]['key']);
                  // print(listOfToDo[0]['id']);
                  // print('cart ${cart.length}');
                  if (cartBox.isEmpty) {
                    return Center(
                      child: Text(
                        'Cart is Empty',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: cartBox.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                  flex: 1,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                  onPressed: (context) {
                                    deleteCart(index);
                                  },
                                )
                              ]),
                              child: Container(
                                height: MediaQuery.of(context).size.height * .11,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    boxShadow: [BoxShadow(color: Colors.grey.shade500, spreadRadius: 5, blurRadius: .3, offset: Offset(0, 1))]),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Image.network(
                                            cartBox[index]['img'],
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(top: 12, left: 20),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartBox[index]['title'],
                                                style: GoogleFonts.montserrat(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                cartBox[index]['category'],
                                                style: GoogleFonts.montserrat(color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '\$${cartBox[index]['prices']}',
                                                style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                                              ),
                                            ]),
                                      )
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
