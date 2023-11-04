import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'profilepage.dart';
import 'now_playing.dart';
import 'announcements.dart';
import 'main.dart';

class gnav extends StatefulWidget {
  gnav({super.key});

  @override
  State<gnav> createState() => _gnavState();
}

class _gnavState extends State<gnav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // margin: EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: GNav(
        backgroundColor: Colors.white,
        gap: 4,
        color: Color.fromARGB(255, 72, 76, 82),
        activeColor: Color.fromARGB(178, 0, 0, 0),
        tabBackgroundColor: Color.fromARGB(255, 241, 250, 255),
        padding: EdgeInsets.all(16),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'home',
          ),
          GButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => now_playing()));
            },
            icon: Icons.search,
            text: 'search',
          ),
          GButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icons.favorite_border,
            text: '---',
          ),
          GButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
        // selectedIndex: selectedIndex,
        // onTabChange: (index) {
        //   setState(() {
        //     selectedIndex = index;
        //   });}
      ),
    );
  }
}