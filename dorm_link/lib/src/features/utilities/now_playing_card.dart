import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NowPlayingCard extends StatelessWidget {
  const NowPlayingCard({super.key, required this.sportName});

  final String sportName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12),),
      child: Column(
        children: [
          Text(
            sportName,
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          const Spacer(),

        ],
      ),
    );
  }
}
