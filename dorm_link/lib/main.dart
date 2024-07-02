import 'package:dorm_link/src/UserData/userdata.dart';
import 'package:dorm_link/src/features/auth/login.dart';
import 'package:dorm_link/src/features/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'src/features/complaints/complaints_screen.dart';
import 'src/features/homepage/home_screen.dart';
import 'src/features/profile/profilepage.dart';
import 'src/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  final user= Get.put(UserController());
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  user.token=preferences.getString("token");
  user.userid=preferences.getString("userId");
  user.enrollmentno=preferences.getString("enrollmentNo");
  user.name=preferences.getString("name");
  user.hostel=preferences.getString("hostel");
  user.roomno=preferences.getString("roomNo");
  user.isadmin=preferences.getBool("isAdmin");
  runApp(ProviderScope(
    child: MyApp(
      token: preferences.getString("token"),
    ),
  ));
}

class AuthenticationRepository {
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
        home: token != null
            ? (JwtDecoder.isExpired(token)
                ? LoginPage()
                : MyHomePage(
                    token: token,
                  ))
            : LoginPage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.token});

  final String token;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 250, 255),
      body: Center(
          child: [
        HomeScreen(token: widget.token,),
        UtilitiesScreen(token: widget.token,),
        const Complaints(),
        const ProfilePage(),
      ][selectedIndex]),
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
            color: const Color.fromARGB(255, 72, 76, 82),
            activeColor: const Color.fromARGB(178, 0, 0, 0),
            tabBackgroundColor: const Color.fromARGB(255, 241, 250, 255),
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.sports_soccer_outlined,
                text: 'Utilities',
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
