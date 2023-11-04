import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import './main.dart';
import './gnav.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 250, 255),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 35),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF4A9DFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                  ),

                  width: 250,
                  margin: const EdgeInsets.only(left: 0),
                  // alignment: Alignment.centerLeft,
                  // color: Color(0xFF4A9DFF),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 18, bottom: 18, right: 15),
                    child: Text(
                      // style: TextStyle(),
                      'Profile',
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
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(150, 40, 30, 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                iconSize: 35,
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
        Container(
          width: 100,
          height: 100,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child:
                  const Image(image: AssetImage('assets/images/shashank.jpg')),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: const Center(
              child: Text(
            'SHASHANK ARORA',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xFF2B2E35),
            ),
          )),
        ),
        Container(
          child: const Text('IIT2022502',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF70788A),
              )),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Text('Hostel',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('BH-3',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Text('Room No',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('714',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                          'Caretaker',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text('Mr Ram Prakash',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(onPressed: null, child: Icon(Icons.call)),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                          'Warden',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text('Dr. Bhupendra Jogi',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Icon(Icons.call)),
            ],
          ),
        )
      ]),
      //bottomNavigationBar: gnav(),
    );
  }
}
