import 'package:flutter/material.dart';
import 'complaint_card.dart';

final List<Widget> resolved = [
  const ComplaintCard(
    heading: "Tubelight not working",
    description: "Tubelight is fused.",
  ),
  const ComplaintCard(
      heading: "Tubelight not working",
      description: "Tubelight is fused."),
];

final List<Widget> unresolved = [
  const ComplaintCard(
    heading: "Tubelight not working",
    description: "Tubelight is fused.",
  ),
  const ComplaintCard(heading: "Fan not working", description: "No regulator"),
];
