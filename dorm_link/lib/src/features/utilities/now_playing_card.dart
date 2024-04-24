import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:google_fonts/google_fonts.dart';

class NowPlayingCard extends StatelessWidget {
  const NowPlayingCard({super.key, required this.sportName});

  final String sportName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
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
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      child: Align(
                        heightFactor: 0.75,
                        child: Initicon(text: "Full Name")
                      )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: const Align(
                      heightFactor: 0.5,
                      child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Color(0xff209fa6),
                          child: Text(
                            "25",
                            style: TextStyle(
                                fontSize: 8, color: Colors.white),
                          )),
                    )),
              ],
              ),


        ],
      ),
    );
  }
}
