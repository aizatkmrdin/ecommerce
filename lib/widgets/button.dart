import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BgButton extends StatelessWidget {
  BgButton({
    required this.title,
    super.key,
  });

  String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.grey,
            //     offset: Offset(0.0, 1.0), //(x,y)
            //     blurRadius: 8.0,
            //   )
            // ],
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(color: Colors.white, letterSpacing: .5, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          )),
    );
  }
}

class BgButtonLoading extends StatelessWidget {
  const BgButtonLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 8.0,
              )
            ],
          ),
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )),
    );
  }
}
