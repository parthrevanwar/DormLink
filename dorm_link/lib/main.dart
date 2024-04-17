import 'package:dorm_link/src/features/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dorm_link/src/features/nowplaying/now_playing_screen.dart';
import 'src/features/complaints/complaints_screen.dart';
import 'src/features/homepage/home_screen.dart';
import 'src/features/profile/profilepage.dart';
import 'src/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(
      ProviderScope(
        child: MyApp(
          token: preferences.getString("token"),
        ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.token});

  final token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dorm Link',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
         home: token != null  ? (JwtDecoder.isExpired(token) ? LoginPage() :
        MyHomePage(token: token,)
    )
           : LoginPage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.token});

  final token;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    now_playing(),
    Complaints(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 250, 255),
      body: Center(child: _widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: GNav(
            tabBorderRadius: 50,
            backgroundColor: Colors.white,
            gap: 4,
            color: Color.fromARGB(255, 72, 76, 82),
            activeColor: Color.fromARGB(178, 0, 0, 0),
            tabBackgroundColor: Color.fromARGB(255, 241, 250, 255),
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.sports_soccer_outlined,
                text: 'Now Playing',
              ),
              GButton(
                icon: Icons.note,
                text: 'Complaint Log',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            }),
      ),
    );
  }
}
