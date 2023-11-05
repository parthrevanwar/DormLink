import 'package:dorm_link/new_complaint.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'ticket.dart';
import 'package:google_fonts/google_fonts.dart';
import './complaint_card.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'profilepage.dart';
// import 'now_playing.dart';
// import 'announcements.dart';
// import 'main.dart';

class complaints extends StatefulWidget {
  const complaints({super.key});

  @override
  State<complaints> createState() => _complaintsState();
}

class _complaintsState extends State<complaints> {
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
              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 36),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF4A9DFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),

                  width: 235,
                  margin: const EdgeInsets.only(left: 0),
                  // alignment: Alignment.centerLeft,
                  // color: Color(0xFF4A9DFF),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 13, bottom: 13, right: 15),
                    child: Text(
                      // style: TextStyle(),
                      'Complaints',
                      style: GoogleFonts.poppins(
                          height: 0,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF1FAFF)),

                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 16),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18, top: 18),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 16),
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
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(
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
