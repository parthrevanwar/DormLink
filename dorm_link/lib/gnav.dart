import 'package:dorm_link/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'profilepage.dart';
import 'now_playing.dart';
// import 'announcements.dart';
// import 'main.dart';

class gnav extends StatefulWidget {
  gnav({super.key});

  @override
  State<gnav> createState() => _gnavState();
}

class _gnavState extends State<gnav> {
  int index = 0;
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
            // onPressed: () {
            //   Navigator.push(
            //       context, MaterialPageRoute(builder: (context) => MyApp()));
            //   setState(() {});
            // },
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            // onPressed: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => now_playing()));
            //   setState(() {});
            // },
            icon: Icons.sports_soccer,
            text: 'Search',
          ),
          GButton(
            // onPressed: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => ProfilePage()));
            //   setState(() {});
            // },
            icon: Icons.note_add_outlined,
            text: 'Complaint Log',
          ),
          GButton(
            active: index == 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
              setState(() {
                // _gnavState() = ;
              });
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
