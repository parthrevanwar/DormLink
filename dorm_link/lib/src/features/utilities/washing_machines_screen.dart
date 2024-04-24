import 'dart:convert';

import 'package:dorm_link/src/features/utilities/washing_machine_card.dart';
import 'package:dorm_link/src/models/washing_machine.dart';
import 'package:dorm_link/src/provider/washing_machine_provider.dart';
import 'package:flutter/material.dart';
import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WashingMachinesScreen extends ConsumerStatefulWidget {
  const WashingMachinesScreen({super.key, required this.token});

  final String token;

  @override
  ConsumerState<WashingMachinesScreen> createState() => _WashingMachinesScreenState();
}

class _WashingMachinesScreenState extends ConsumerState<WashingMachinesScreen> {
  late Future<void> _washingMachinesFuture;
  @override
  void initState() {
    _washingMachinesFuture = ref
        .read(washingMachineProvider.notifier)
        .fetchWashingMachines(widget.token);
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    final allWashingMachine = ref.watch(washingMachineProvider);
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
                future: _washingMachinesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      for (var washingMachine in allWashingMachine)
                        WashingMachineCard(washingMachine,
                          token: widget.token,
                        ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
