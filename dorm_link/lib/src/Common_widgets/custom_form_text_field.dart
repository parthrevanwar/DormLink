import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.validator,
      required this.hintText,
      required this.enteredValue,
      this.isPassword=false});

  final String? Function(String?)? validator;
  final String hintText;
  late String enteredValue;
  bool isPassword;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      validator: validator,
      onSaved: (value) {
        enteredValue = value!;
        //print(enteredValue);
      },
      cursorColor: Color(0xFF4A9DFF),
      decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF4A9DFF),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
