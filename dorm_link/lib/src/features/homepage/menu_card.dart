import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.title, required this.description});

  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF121212).withOpacity(0.05),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SvgPicture.asset("assets/images/food-icon.svg")
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Text(
                      description,
                      style:  GoogleFonts.poppins(
                          color: Colors.white),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
