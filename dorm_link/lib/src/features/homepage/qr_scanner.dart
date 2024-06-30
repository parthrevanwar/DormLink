import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/Common_widgets/custombigbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/register.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key? key, required this.token}) : super(key: key);

  final String token;


  @override
  State<QrScannerPage> createState() => _QrScannerPage();
}

class _QrScannerPage extends State<QrScannerPage> {
  ScanResult? scanResult;
  String? rollno;
  String? token;

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  var _aspectTolerance = 0.00;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  Future<String?> _loadtoken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token=preferences.getString("token") ?? '';
    return token ;
  }
  @override
  void initState() {
    _loadtoken();
    super.initState();
  }


  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  Widget build(BuildContext context) {
    final scanResult = this.scanResult;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 90, 0, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: "Scan Qr"),
            Spacer(),
            Center(child: SvgPicture.asset("assets/images/qrcode.svg")),
            Spacer(),
            Center(
              child: Text(
                scanResult == null || scanResult.rawContent == ""
                    ? "Scan the Qr code to\nmark the attaindance"
                    : "Marking mess attaindance \n for $rollno",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: scanResult == null || scanResult.rawContent == ""
                  ? CustomBigButton(onTap: _scan, title: "Scan Qr code")
                  : CustomBigButton(onTap: markattaindance, title: "Confirm"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      setState(() {
        scanResult = result;
        rollno = result.rawContent;
      });
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }

  final _client = http.Client();
  final _createattaindanceUrl = Uri.parse("$baseUrl/attendance/");
  final _registerUrl = Uri.parse("register");

  void markattaindance() async {
    if(rollno==null){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(
            "Scan again", style: TextStyle(color: Colors.white),)));
      return;
    }
    http.Response response = await _client.post(_createattaindanceUrl,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'authorization': widget.token
        },
        body: json.encode({
          "mealType": "dinner",
          "attendees": rollno?.toUpperCase(),
        }));
    print(response.statusCode.toString());
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(
            "Attaindance recorded", style: TextStyle(color: Colors.white),)));
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            response.body, style: const TextStyle(color: Colors.white),)));
    }
  }
}