import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './main.dart';
import './gnav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 250, 255),
      body: Column(children: [
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(20, 70, 30, 10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            iconSize: 35,
          ),
        ),
        Container(
          width: 100,
          height: 100,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child:
                  const Image(image: AssetImage('assets/image/shashank.jpg')),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: const Center(
              child: Text(
            'SHASHANK ARORA',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xFF2B2E35),
            ),
          )),
        ),
        Container(
          child: const Text('IIT2022502',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF70788A),
              )),
        ),
      ]),
      bottomNavigationBar: gnav(),
    );
  }
}
