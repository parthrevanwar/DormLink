import 'dart:convert';

import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/features/utilities/now_playing_screen.dart';
import 'package:dorm_link/src/features/utilities/washing_machines_screen.dart';
import 'package:dorm_link/src/features/utilities/washingmachine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:http/http.dart' as http;

class UtilitiesScreen extends StatelessWidget {
  const UtilitiesScreen({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // title: Text(
        //   "Utilities",
        //   style: TextStyle(
        //       color: Theme.of(context).colorScheme.onBackground,
        //       fontWeight: FontWeight.bold),
        // ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Utilities"),
          SafeArea(
            minimum: EdgeInsets.all(20),
            child: Column(
              children: [
                SlotsCard(
                  buttonText: "BOOK/VIEW SLOT",
                  heading: "Washing Machine",
                  text: "",
                  icon: SvgPicture.asset("assets/images/washing-machine.svg", height: 60,),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) =>
                            WashingMachinesScreen(token: token)));
                  },
                ),
                SlotsCard(
                    buttonText: "PLAY/VIEW SPORTS",
                    heading: "Sports",
                    text: "Currently",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => now_playing(token: token,)));
                    },
                    icon: Icon(
                      Icons.sports_baseball_outlined,
                      size: 60,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
