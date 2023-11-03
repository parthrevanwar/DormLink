import 'package:flutter/material.dart';
import 'package:dorm_link/sidebar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        titleSpacing: 0,
        // backgroundColor: Color.fromARGB(255, 88, 88, 173),
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
          Center(
              child: const Text(
            'BH-1',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          )),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: GNav(
            gap: 4,
            color: Color.fromARGB(255, 72, 76, 82),
            activeColor: Color.fromARGB(178, 0, 0, 0),
            tabBackgroundColor: Color.fromARGB(100, 217, 233, 253),
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'home',
              ),
              GButton(
                icon: Icons.search,
                text: 'search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'settings',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: '---',
              ),
            ]),
      ),
    );
  }
}
