import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActionsTile extends StatelessWidget {
  const QuickActionsTile({super.key, required this.icon, required this.text, this.onTap});

  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: deviceWidth * 0.28,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          children: [
            Icon(icon ,size: 36,color: Theme.of(context).colorScheme.primary,),
            const Spacer(),
            Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
