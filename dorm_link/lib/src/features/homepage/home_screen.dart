import 'package:dorm_link/src/features/homepage/menu_box.dart';
import 'package:dorm_link/src/features/homepage/washingmachine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'announcements_box.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.token});

  final token;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var name = ' ';

    Future<void> _loadName() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        name = preferences.getString("name") ?? '';
      });
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
                //UserBox(),
                const SizedBox(
                  height: 12,
                ),
                WashingMachineCard(),
                const SizedBox(height: 24,),
                MenuBox(),
                AnnouncementsBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}