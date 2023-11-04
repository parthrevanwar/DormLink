import 'package:dorm_link/gnav.dart';
import 'package:flutter/material.dart';

class now_playing extends StatelessWidget {
  const now_playing({super.key});

  @override
  Widget build(BuildContext context) {
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
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),

                    width: 250,
                    margin: EdgeInsets.only(left: 0),
                    // alignment: Alignment.centerLeft,
                    // color: Color(0xFF4A9DFF),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 13, bottom: 9, right: 15),
                      child: Text(
                        // style: TextStyle(),
                        'Now\nPlaying',
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.add, color: Colors.white, weight: 500),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.blue, // <-- Button color
                    foregroundColor: Colors.red, // <-- Splash color
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 10, bottom: 10, top: 15.0),
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 19.0, top: 14),
                      child: Text('Badminton',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 25, bottom: 10, top: 15.0),
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 19.0, top: 14),
                      child: Text(
                        'Table Tennis',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
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
                      left: 25.0, right: 10, bottom: 20, top: 10.0),
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 19.0, top: 14),
                      child: Text('Badminton',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 25, bottom: 20, top: 10.0),
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 19.0, top: 14),
                      child: Text(
                        'Table Tennis',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: gnav(),
    );
  }
}
