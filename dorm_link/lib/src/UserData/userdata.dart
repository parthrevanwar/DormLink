import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserController extends GetxController{
  static UserController get instance => Get.find();
  String? userid;
  String? enrollmentno;
  String? name;
  String? hostel;
  bool? isadmin;
  String? roomno;
  String? token;
}