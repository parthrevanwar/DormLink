import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF4A9DFF),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      margin: const EdgeInsets.only(left: 0),
      // alignment: Alignment.centerLeft,
      // color: Color(0xFF4A9DFF),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 10, bottom: 10, right: 20),
        child: Text(
          // style: TextStyle(),
          title,
          style: GoogleFonts.poppins(
              height: 0,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1FAFF)),

          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
