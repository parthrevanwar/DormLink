import 'package:flutter/material.dart';

class CustomBigButton extends StatelessWidget {
  const CustomBigButton({super.key, required this.press, required this.title});
  final VoidCallback press;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4A9DFF),
          shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(20)),
          ),
        ),
        child: Text(title,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
