import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'profilepage.dart';
// import 'now_playing.dart';
// import 'announcements.dart';
// import 'main.dart';

class complaints extends StatelessWidget {
  const complaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 250, 255),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF4A9DFF),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              width: 250,
              height: 80,
              margin: EdgeInsets.only(left: 0),
              // alignment: Alignment.centerLeft,
              // color: Color(0xFF4A9DFF),
              child: const Padding(
                padding:
                    EdgeInsets.only(left: 1.0, top: 13, bottom: 9, right: 15),
                child: Text(
                  // style: TextStyle(),
                  '   Now Playing',

                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
