import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/features/utilities/currently_playing.dart';
import 'package:dorm_link/src/features/utilities/now_playing_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class now_playing extends StatefulWidget {
  const now_playing({super.key});

  @override
  State<now_playing> createState() => _now_playingState();
}

class _now_playingState extends State<now_playing> {
  @override
  Widget build(BuildContext context) {
    int numOfPlayersBadminton = 4;
    int numOfPlayersFootball = 4;
    int numOfPlayersCricket = 0;
    int numOfPlayersTT = 4;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 250, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: "Now Playing"),
            SafeArea(
              minimum: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: NowPlayingCard(sportName: "Badminton")),
                      Expanded(child: NowPlayingCard(sportName: "Badminton")),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Center(child: Text("Select Sport")),
                    content: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Playing(
                                      badminton: numOfPlayersBadminton + 1,
                                      football: numOfPlayersFootball,
                                      cricket: numOfPlayersCricket,
                                      tt: numOfPlayersTT),
                                ),
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(),
                          child: Text(
                            "Badminton",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Playing(
                                      badminton: numOfPlayersBadminton,
                                      football: numOfPlayersFootball + 1,
                                      cricket: numOfPlayersCricket,
                                      tt: numOfPlayersTT),
                                ),
                              );
                            },
                            child: Text(
                              "Football",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Playing(
                                      badminton: numOfPlayersBadminton,
                                      football: numOfPlayersFootball,
                                      cricket: numOfPlayersCricket + 1,
                                      tt: numOfPlayersTT),
                                ),
                              );
                            },
                            child: Text(
                              "Cricket",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Playing(
                                      badminton: numOfPlayersBadminton,
                                      football: numOfPlayersFootball,
                                      cricket: numOfPlayersCricket,
                                      tt: numOfPlayersTT + 1),
                                ),
                              );
                            },
                            child: Text(
                              "Table Tennis",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            )),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.add)));
  }
}
