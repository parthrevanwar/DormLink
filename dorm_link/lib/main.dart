import 'package:flutter/material.dart';
import 'package:dorm_link/sidebar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    final String name = "Shashank";
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 250, 255),
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
        actions: [
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
      body: Column(
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          const Center(
            child: Text(
              'BH-1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello $name',
                style: GoogleFonts.poppins(fontSize: 15),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Text(
            'Hello $name',
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Center(
              child: Container(
                height: 140,
                width: 320,
                // color: Color.fromARGB(255, 74, 158, 255),
                decoration: BoxDecoration(
                  color: Color(0xFF4A9DFF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        // margin: EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: const GNav(
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
              icon: Icons.search,
              text: 'search',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: '---',
            ),
          ],
        ),
      ),
    );
  }
}
