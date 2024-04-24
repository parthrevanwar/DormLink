import 'package:flutter/material.dart';

class ColorLegend extends StatelessWidget {
  const ColorLegend({super.key, required this.color, required this.legend});

  final Color color;
  final String legend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
              border: Border.all(color: Colors.black.withOpacity(0.2))),
        ),
        const SizedBox(width: 8,),
        Text(legend, style: TextStyle(color: Theme.of(context).colorScheme.onBackground),),
      ],
    );
  }
}
