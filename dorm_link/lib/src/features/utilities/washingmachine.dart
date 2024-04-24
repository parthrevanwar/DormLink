import 'package:dorm_link/src/features/utilities/book_slot.dart';
import 'package:dorm_link/src/features/utilities/washing_machines_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SlotsCard extends StatelessWidget {
  const SlotsCard(
      {super.key, required this.heading, required this.text, required this.icon, this.onTap, required this.buttonText});

  final String heading;
  final String text;
  final Widget icon;
  final String buttonText ;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF121212).withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: icon
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 18, color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
                  ),
                  // Text(
                  //   text,
                  //   style: GoogleFonts.poppins(color: Colors.grey),
                  //   softWrap: true,
                  // ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      // Expanded(
                      //   child: Container(
                      //     child: TextButton(
                      //       onPressed: () {},
                      //       child: Text(
                      //           "VIEW SLOTS"
                      //       ),
                      //     ),
                      //     decoration: ShapeDecoration(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(12),
                      //             side: BorderSide(
                      //               width: 1,
                      //               color: Theme
                      //                   .of(context)
                      //                   .colorScheme
                      //                   .primary,
                      //             )
                      //         )
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          child: TextButton(
                            onPressed: onTap,
                            child: Text(
                              buttonText, style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                            ),
                          ),
                          decoration: ShapeDecoration(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}