import 'package:dorm_link/src/features/homepage/menu_box.dart';
import 'package:dorm_link/src/features/homepage/mess_attendance.dart';
import 'package:dorm_link/src/features/homepage/qr_code_page.dart';
import 'package:dorm_link/src/features/homepage/qr_scanner.dart';
import 'package:dorm_link/src/features/homepage/quick_actions.dart';
import 'package:dorm_link/src/features/utilities/washingmachine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'announcements_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.token});

  final String token;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var name = ' ';
  var isAdmin=true;

  Future<String> _loadName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
      name = preferences.getString("name") ?? '';
      isAdmin=preferences.getBool("isAdmin") ?? false;
      return name ;
  }

  @override
  void initState() {
    _loadName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Sidebar(),
      backgroundColor: Theme.of(context).colorScheme.background,
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
            // minimum: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'BH-1',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Hello $name!',
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground),
                    textAlign: TextAlign.left,
                  ),
                ),
                //UserBox(),
                const SizedBox(
                  height: 12,
                ),
                //WashingMachineCard(),
                //const SizedBox(height: 24,),
                MenuBox(
                  token: widget.token,
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      QuickActionsTile(
                        icon: Icons.qr_code,
                        text: true?"Scan QR Code":"View QR Code",
                        onTap: () {
                          true?Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => QrScannerPage(token: widget.token,))):
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => QRCodePage()));
                        },
                      ),
                      const Spacer(),
                      QuickActionsTile(
                        icon: Icons.menu_book_outlined,
                        text: "View full Menu",
                        onTap: () {},
                      ),
                      const Spacer(),
                      QuickActionsTile(
                        icon: Icons.co_present_outlined,
                        text: "View Mess Attendance",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => MessAttendance(token: widget.token,)));
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12),
                  child: AnnouncementsBox(widget.token),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
