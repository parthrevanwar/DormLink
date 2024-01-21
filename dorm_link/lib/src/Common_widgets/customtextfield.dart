import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: Color(0xFF4A9DFF),
        decoration: InputDecoration(
          focusColor: Color(0xFF4A9DFF),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              borderSide: BorderSide(
                width: 0.2,
              )),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF4A9DFF),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
