import 'package:dorm_link/src/features/homepage/menu_box.dart';
import 'package:dorm_link/src/features/homepage/user_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'announcements_box.dart';
import '../sidemenu/sidebar.dart';


Size screenSize = WidgetsBinding.instance.window.physicalSize;
double w = screenSize.width;
double h = screenSize.height;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const name = "Shashank";
    return Scaffold(
      //drawer: Sidebar(),
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color.fromARGB(255, 241, 250, 255),
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 241, 250, 255),
          child: SafeArea(
            minimum: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'BH-1',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 30, color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hello $name!',
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onBackground),
                    textAlign: TextAlign.left,
                  ),
                ),
                UserBox(),
                const SizedBox(
                  height: 20,
                ),
                MenuBox(),
                SizedBox(
                  height: 15,
                ),
                AnnouncementsBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
