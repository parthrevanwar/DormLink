import 'package:dorm_link/gnav.dart';
import 'package:dorm_link/picon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class now_playing extends StatelessWidget {
  const now_playing({super.key});

  @override
  Widget build(BuildContext context) {
    int players = 4;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 250, 255),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF4A9DFF),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45),
                          bottomRight: Radius.circular(45),
                        ),
                      ),

                      width: 250,
                      margin: EdgeInsets.only(left: 0),
                      // alignment: Alignment.centerLeft,
                      // color: Color(0xFF4A9DFF),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, top: 18, bottom: 18, right: 15),
                        child: Text(
                          // style: TextStyle(),
                          'Now Playing',
                          style: GoogleFonts.poppins(
                            height: 1.2,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: const SizedBox(
                    width: 55,
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     child: Icon(Icons.add, color: Colors.white, weight: 500),
                //     style: ElevatedButton.styleFrom(
                //       shape: CircleBorder(),
                //       padding: EdgeInsets.all(20),
                //       backgroundColor: Colors.blue, // <-- Button color
                //       foregroundColor: Colors.red, // <-- Splash color
                //     ),
                //   ),
                // )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 10, bottom: 10, top: 15.0),
                    child: Container(
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(14, 18, 18, 18),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 19.0, top: 14),
                            child: Text('Badminton',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 14.0, left: 15.0),
                                child: SvgPicture.asset(
                                  "assets/images/str.svg",
                                  semanticsLabel: "SVG",
                                  height: 24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text('+ $players more'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20, bottom: 10, top: 15.0),
                    child: Container(
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(14, 18, 18, 18),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 19.0, top: 14),
                            child: Text('Football',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 14.0, left: 15.0),
                                child: SvgPicture.asset(
                                  "assets/images/str.svg",
                                  semanticsLabel: "SVG",
                                  height: 24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text('+ $players more'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 10, bottom: 20, top: 10.0),
                    child: Container(
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(14, 18, 18, 18),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 19.0, top: 14),
                            child: Text('Cricket',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              //   Padding(
                              //     padding: const EdgeInsets.only(
                              //         bottom: 14.0, left: 15.0),
                              //     child: SvgPicture.asset(
                              //       "assets/images/str.svg",
                              //       semanticsLabel: "SVG",
                              //       height: 24,
                              //     ),
                              //   ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 18.0, left: 18),
                                child: Text('None Playing'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20, bottom: 20, top: 10.0),
                    child: Container(
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(14, 18, 18, 18),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 19.0, top: 14),
                            child: Text('Table Tennis',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 14.0, left: 15.0),
                                child: SvgPicture.asset(
                                  "assets/images/str.svg",
                                  semanticsLabel: "SVG",
                                  height: 24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text('+ $players more'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton:
            const FloatingActionButton(onPressed: null, child: Icon(Icons.add))
        // bottomNavigationBar: gnav(),
        );
  }
}
