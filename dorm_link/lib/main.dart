import 'package:dorm_link/gnav.dart';
import 'package:flutter/material.dart';
import 'package:dorm_link/sidebar.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:dorm_link/now_playing.dart';
// import 'announcements.dart';

import './home.dart';
import './profilepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 217, 233, 253)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Likes',
    ),
    Text(
      'Search',
    ),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    //Widget? currentScreen = const Home();
    // final int index = 5;
    // void switchToProfile() {
    //   setState(() {
    //     currentScreen = ProfilePage();
    //   });
    // }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 250, 255),
      drawer: Sidebar(),
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Color.fromARGB(255, 241, 250, 255),
        centerTitle: true,
        // toolbarHeight: 100,
        // title: const Text(
        //   'BH-1',
        //   style: TextStyle(),
        // ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              size: 35,
              Icons.notifications,
              color: Color.fromARGB(168, 0, 0, 0),
            ),
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: gnav(),
      //Container(
      //   color: Colors.white,
      //   // margin: EdgeInsets.all(15),
      //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      //   child: GNav(
      //     backgroundColor: Colors.white,
      //     gap: 4,
      //     color: Color.fromARGB(255, 72, 76, 82),
      //     activeColor: Color.fromARGB(178, 0, 0, 0),
      //     tabBackgroundColor: Color.fromARGB(255, 241, 250, 255),
      //     padding: EdgeInsets.all(16),
      //     tabs: [
      //       GButton(
      //         icon: Icons.home,
      //         text: 'home',
      //       ),
      //       GButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => now_playing()));
      //         },
      //         icon: Icons.search,
      //         text: 'search',
      //       ),
      //       GButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => ProfilePage()));
      //         },
      //         icon: Icons.favorite_border,
      //         text: '---',
      //       ),
      //       GButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => ProfilePage()));
      //         },
      //         icon: Icons.person,
      //         text: 'Profile',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
