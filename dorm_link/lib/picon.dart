import 'package:flutter/material.dart';

class picon extends StatelessWidget {
  const picon({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
        child: Column(
      children: [
        Opacity(
          opacity: 0.60,
          child: Container(
            width: 113,
            height: 24,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFF810C),
                              shape: OvalBorder(
                                side: BorderSide(width: 2, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'S',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  top: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Color(0xFF0C7CFF),
                              shape: OvalBorder(
                                side: BorderSide(width: 2, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'T',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 28,
                  top: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFF3838),
                              shape: OvalBorder(
                                side: BorderSide(width: 2, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'R',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '+4 more',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
