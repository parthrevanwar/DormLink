import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/Common_widgets/custombigbutton.dart';
import 'package:dorm_link/src/features/utilities/currently_playing.dart';
import 'package:dorm_link/src/features/utilities/now_playing_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dorm_link/src/features/auth/register.dart';

class now_playing extends StatefulWidget {
  const now_playing({super.key, required this.token});

  final String token;

  @override
  State<now_playing> createState() => _now_playingState();
}

class _now_playingState extends State<now_playing> {
  int numOfPlayersBadminton = 1;
  int numOfPlayersFootball = 2;
  int numOfPlayersCricket = 0;
  int numOfPlayersTT = 4;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  // _fetchNumOfPlayers() async {
  //   final sportsUrl = Uri.parse("$baseUrl/sports/playing");
  //   http.Response response = await http.get(
  //     sportsUrl,
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'authorization': widget.token
  //     },
  //   );
  //   var json = jsonDecode(response.body);
  //   print(json);
  // }

  @override
  Widget build(BuildContext context) {
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
                      Expanded(
                          child: NowPlayingCard(
                        sportName: "Badminton",
                        token: widget.token,
                        numOfPlayers: numOfPlayersBadminton,
                      )),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: NowPlayingCard(
                        sportName: "Table Tennis",
                        token: widget.token,
                        numOfPlayers: numOfPlayersTT,
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: NowPlayingCard(
                        sportName: "Cricket",
                        token: widget.token,
                        numOfPlayers: numOfPlayersCricket,
                      )),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: NowPlayingCard(
                        sportName: "Football",
                        token: widget.token,
                        numOfPlayers: numOfPlayersFootball,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: isPlaying
                ? () {
                    setState(() {
                      isPlaying = false;
                      //initState();
                    });
                  }
                : () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Center(
                              child: Text(
                            "Select Sport",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          )),
                          content: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4),
                                child: CustomBigButton(
                                  onTap: () {
                                    setState(() {
                                      isPlaying = true;
                                      numOfPlayersBadminton++;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  title: "Badminton",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4),
                                child: CustomBigButton(
                                  onTap: () {
                                    setState(() {
                                      isPlaying = true;
                                      numOfPlayersTT++;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  title: "Table Tennis",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4),
                                child: CustomBigButton(
                                  onTap: () {
                                    setState(() {
                                      isPlaying = true;
                                      numOfPlayersCricket++;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  title: "Cricket",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4),
                                child: CustomBigButton(
                                  onTap: () {
                                    setState(() {
                                      isPlaying = true;
                                      numOfPlayersFootball++;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  title: "Football",
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
            child: isPlaying
                ? const Icon(Icons.check_rounded)
                : const Icon(Icons.add)));
  }
}
