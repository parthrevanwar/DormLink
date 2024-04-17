import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoNotifier extends StateNotifier<String> {
  UserInfoNotifier() : super("");

  Future<void> getValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final val = preferences.getString(key);
    state = val ?? "null";
  }
}

final userInfoProvider = StateNotifierProvider<UserInfoNotifier, String>((ref) => UserInfoNotifier());
