import 'package:flutter/material.dart';
import 'complaint_card.dart';

const List<Widget> resolved = [
  ComplaintCard(
    heading: "Tubelight not working",
    description: "Tubelight is fused.",
  ),
  ComplaintCard(
      heading: "Tubelight not working",
      description: "Tubelight is fused."),
];

const List<Widget> unresolved = [
  ComplaintCard(
    heading: "Tubelight not working",
    description: "Tubelight is fused.",
  ),
  ComplaintCard(heading: "Fan not working", description: "No regulator"),
];
