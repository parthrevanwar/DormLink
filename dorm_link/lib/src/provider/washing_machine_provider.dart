import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dorm_link/src/models/washing_machine.dart';

class WashingMachineNotifier extends StateNotifier<List<dynamic>> {
  WashingMachineNotifier() : super([]);

  Future<void> fetchWashingMachines(String? token) async {
    if (token == null) {
      print("no token");
      return;
    }
    final washingMachineUrl =
    Uri.parse("$baseUrl/washingmachine/list-washing-machines");
    http.Response response = await http.get(
      washingMachineUrl,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': token
      },
    );
    final allWashingMachine = [];
    final json = jsonDecode(response.body);
    print(json);

      for (int i = 0; i < json.length; i++) {
        allWashingMachine.add(WashingMachine.fromJson(json[i]));
      }
    state = allWashingMachine;
  }
}

final washingMachineProvider =
    StateNotifierProvider<WashingMachineNotifier, List<dynamic>>(
        (ref) => WashingMachineNotifier());