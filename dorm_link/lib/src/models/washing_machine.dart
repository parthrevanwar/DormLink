import 'dart:convert';

class WashingMachine {
  String id;
  int machineNumber;
  String location;
  int floor;
  List<String?> slots;
  int v;

  WashingMachine({
    required this.id,
    required this.machineNumber,
    required this.location,
    required this.floor,
    required this.slots,
    required this.v,
  });


  factory WashingMachine.fromRawJson(String str) => WashingMachine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WashingMachine.fromJson(Map<String, dynamic> json) => WashingMachine(
    id: json["_id"],
    machineNumber: json["machineNumber"],
    location: json["location"],
    floor: json["floor"],
    slots: List<String?>.from(json["slots"].map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "machineNumber": machineNumber,
    "location": location,
    "floor": floor,
    "slots": List<dynamic>.from(slots.map((x) => x)),
    "__v": v,
  };
}
