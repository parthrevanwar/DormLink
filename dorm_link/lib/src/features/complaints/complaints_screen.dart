import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/features/complaints/new_complaint.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'complaint_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'complaints_list.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'profilepage.dart';
// import 'now_playing_screen.dart';
// import 'announcements_box.dart';
// import 'main.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    int numOfActiveTickets = resolved.length;
    int numOfResolvedTickets = unresolved.length;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 250, 255),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80,),
              CustomAppBar(title: "Complaints"),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 16),
                            child: Text(
                              "Ongoing Tickets",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const ShapeDecoration(
                                shape: OvalBorder(), color: Color(0xFFC1DCFB)),
                            child: Center(
                              child: Text(
                                '$numOfActiveTickets',
                                style: const TextStyle(
                                  color: Color(0xFF539CF3),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ...unresolved,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18, top: 18),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 16),
                            child: Text(
                              "Resolved Tickets",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const ShapeDecoration(
                                shape: OvalBorder(), color: Color(0xFFC1DCFB)),
                            child: Center(
                              child: Text(
                                '$numOfResolvedTickets',
                                style: const TextStyle(
                                  color: Color(0xFF539CF3),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ...resolved,
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(

            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewComplaint(),
                  ),
                );
              });
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
