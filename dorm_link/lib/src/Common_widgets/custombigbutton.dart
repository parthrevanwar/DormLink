import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBigButton extends StatelessWidget {
  const CustomBigButton({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromARGB(14, 18, 18, 18),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ]),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shadowColor: const Color(0x13121212),
          elevation: 2,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        child: Text(title,
            style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
