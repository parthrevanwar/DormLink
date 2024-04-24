import 'dart:convert';

import 'package:dorm_link/src/features/utilities/washing_machine_card.dart';
import 'package:dorm_link/src/models/washing_machine.dart';
import 'package:flutter/material.dart';
import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WashingMachinesScreen extends StatefulWidget {
  const WashingMachinesScreen({super.key, required this.token});

  final String token;

  @override
  State<WashingMachinesScreen> createState() => _WashingMachinesScreenState();
}

class _WashingMachinesScreenState extends State<WashingMachinesScreen> {
  @override
  void initState() {
    _fetchWashingMachines();
    super.initState();
  }

  var allWashingMachine = [];

  Future<void> _fetchWashingMachines() async {
    final washingMachineUrl =
        Uri.parse("$baseUrl/washingMachine/list-Washing-Machines");
    http.Response response = await http.get(
      washingMachineUrl,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': widget.token
      },
    );

    final json = jsonDecode(response.body);
    print(json);
    setState(() {
      for (int i = 0; i < json.length; i++) {
        allWashingMachine.add(WashingMachine.fromJson(json[i]));
      }
    });
    //print(washingMachine);
  }

  int currHour = DateTime.now().hour;

  Widget mainContent = CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Washing Machines"),
          SafeArea(
            minimum: EdgeInsets.all(20),
            child: FutureBuilder(
                future: _fetchWashingMachines(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      for (var washingMachine in allWashingMachine)
                        WashingMachineCard("${washingMachine.floor} Floor",
                            isFree: washingMachine.slots[currHour] == null
                                ? false
                                : true),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
