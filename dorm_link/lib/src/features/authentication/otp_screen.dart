import 'package:dorm_link/src/Common_widgets/custombigbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "CO\nDE",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                  height: 1.2,
                ),
              ),
            ),
            Text(
              "VERIFICATION",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 40,),
            const Text(
              "Enter the verification code sent at\n"
                  "revanwarparth@gmail.com",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.blue.withOpacity(0.1),
              filled: true,
            ),
            const SizedBox(height: 20,),
            CustomBigButton(press: (){}, title: "Continue")
          ],
        ),
      ),
    );
  }
}
