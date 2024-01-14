import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF4A9DFF),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, top: 13, bottom: 13, right: 15),
          child: Text(
            // style: TextStyle(),
            'Profile',
            style: GoogleFonts.poppins(
                height: 0,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1FAFF)),

            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
