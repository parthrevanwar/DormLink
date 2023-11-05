import 'package:flutter/material.dart';

import './ticket.dart';

List<Widget> resolved = [
  TicketButton(
    heading: "Tubelight not working",
    description: "Tubelight is fused. It is not working",
  ),
  TicketButton(
      heading: "Tubelight not working",
      description: "Tubelight is fused. It is not working"),
];

List<Widget> unresolved = [
  TicketButton(
    heading: "Tubelight not working",
    description: "Tubelight is fused. It is not working",
  ),
  TicketButton(heading: "Fan not working", description: "No regulator"),
];
