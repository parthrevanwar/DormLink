import 'dart:convert';

import 'package:dorm_link/src/features/utilities/sport_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:http/http.dart' as http;

class NowPlayingCard extends StatefulWidget {
  const NowPlayingCard(
      {super.key,
      required this.sportName,
      required this.token,
      required this.numOfPlayers});

  final String sportName;
  final String token;
  final int numOfPlayers;

  @override
  State<NowPlayingCard> createState() => _NowPlayingCardState();
}

class _NowPlayingCardState extends State<NowPlayingCard> {
  @override
  void initState() {
    _fetchTotalPlayers();
    super.initState();
  }

  void _fetchTotalPlayers() async {
    final sportsUrl =
        Uri.parse("$baseUrl/sports/playing/${widget.sportName.toLowerCase()}");
    http.Response response = await http.get(
      sportsUrl,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': widget.token
      },
    );
    var json = jsonDecode(response.body);
    print(json);
  }

  @override
  Widget build(BuildContext context) {
    const initIconColor = [Colors.blue, Colors.orange, Colors.green];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => SportsScreen(
                sportName: widget.sportName,
                token: widget.token,
                numOfPlayers: widget.numOfPlayers)));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 6),
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(children: [
          Center(
              child: Opacity(
            opacity: 0.2,
            child: SvgPicture.asset(
              "assets/images/${widget.sportName.substring(0, 5).toLowerCase()}.svg",
              height: 60,
            ),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sportName,
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "${widget.numOfPlayers}",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary)),
                TextSpan(
                    text: " students are playing",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onBackground))
              ]))
            ],
          ),
        ]),
      ),
    );
  }
}
