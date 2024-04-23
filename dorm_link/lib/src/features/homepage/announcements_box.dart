import 'package:dorm_link/src/features/homepage/announcement_card.dart';
import 'package:dorm_link/src/provider/announcement_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnnouncementsBox extends ConsumerStatefulWidget {
  const AnnouncementsBox(this.token, {super.key});

  final String token;

  @override
  ConsumerState<AnnouncementsBox> createState() => _AnnouncementsBoxState();
}

class _AnnouncementsBoxState extends ConsumerState<AnnouncementsBox> {
  late Future<void> _announcementsFuture;

  @override
  void initState() {
    _announcementsFuture = ref
        .read(announcementsProvider.notifier)
        .fetchAnnouncements(widget.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _myAnnouncements = ref.watch(announcementsProvider);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Announcements",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: FutureBuilder(
              future: _announcementsFuture,
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _myAnnouncements.length,
                          itemBuilder: (context, index) {
                            return AnnouncementCard(
                              title: _myAnnouncements[index][0],
                              createdBy: _myAnnouncements[index][1],
                              date: _myAnnouncements[index][2],
                            );
                          },
                        )),
        ),
      ],
    );
  }
}
