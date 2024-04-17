import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WashingMachineCard extends StatelessWidget {
  const WashingMachineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
            child: SvgPicture.asset("assets/images/washing-machine.svg")
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Washing Machine",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 18, color: Theme.of(context).colorScheme.onBackground),
                  ),
                  Text(
                    "1/4 is free",
                    style: GoogleFonts.poppins(color: Colors.grey),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      //   Expanded(
                      //     child: Container(
                      //       child: TextButton(
                      //         onPressed: (){},
                      //         child: Text(
                      //             "View Slots"
                      //         ),
                      //       ),
                      //       decoration: ShapeDecoration(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(12),
                      //           side: BorderSide(
                      //             width: 1,
                      //             color: Theme.of(context).colorScheme.primary,
                      //           )
                      //         )
                      //       ),
                      //     ),
                      //   ),
                      //   SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          child: TextButton(
                            onPressed: (){},
                            child: Text(
                              "BOOK SLOT",style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                            ),
                          ),
                          decoration: ShapeDecoration(
                              color: Theme.of(context).colorScheme.primary,
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