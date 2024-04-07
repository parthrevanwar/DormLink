import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WashingMachinCard extends StatelessWidget {
  const WashingMachinCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(14, 18, 18, 18),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.food_bank,
              size: 40,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Washing Machines",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.onBackground),
                  ),
                  Text(
                    "1/4 in use",
                    style: TextStyle(color: Colors.grey),
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
                                "View Machines",style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                          ),
                          decoration: ShapeDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
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
