import 'package:flutter/material.dart';

import './ticket.dart';

List<Widget> resolved = [
  TicketButton(
    heading: "Tubelight not working",
    description: "Tubelight is fused.",
  ),
  TicketButton(
      heading: "Tubelight not working",
      description: "Tubelight is fused."),
];

List<Widget> unresolved = [
  TicketButton(
    heading: "Tubelight not working",
    description: "Tubelight is fused.",
  ),
  TicketButton(heading: "Fan not working", description: "No regulator"),
];
