import 'package:ecommerce/controllers/categories_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesList>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Padding for safe area
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
            // App Bar with action
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi.\nPERRYCOMO',
                  style: GoogleFonts.montserrat(color: Colors.blueGrey, fontWeight: FontWeight.w500, fontSize: 24),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        color: Colors.purple,
                      ),
                      Container(
                        height: 55,
                        width: 55,
                        color: Colors.purple,
                      ),
                    ],
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
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(color: Colors.black),
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15.0),
                    prefixIcon: const Icon(
                      Iconsax.search_normal_1,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search',
                    hintStyle: GoogleFonts.hindSiliguri(textStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500)),
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
            )),
            const SizedBox(
              height: 20,
            ),
            Text(
              value.items.isEmpty ? ' sa' : 'asdsa',
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ]),
        ),
      ),
    );
  }
}
