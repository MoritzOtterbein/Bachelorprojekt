// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));

String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  Plan({
    required this.building,
    required this.items,
  });

  final Building building;
  final List<Item> items;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    building: Building.fromJson(json["building"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "building": building.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Building {
  Building({
    required this.name,
    required this.locality,
    required this.postalCode,
    required this.streetAdress,
  });

  final String name;
  final String locality;
  final String postalCode;
  final String streetAdress;

  factory Building.fromJson(Map<String, dynamic> json) => Building(
    name: json["name"],
    locality: json["locality"],
    postalCode: json["postalCode"],
    streetAdress: json["streetAdress"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "locality": locality,
    "postalCode": postalCode,
    "streetAdress": streetAdress,
  };
}

class Item {
  Item({
    required this.id,
    required this.category,
    required this.date,
    required this.descriptionClean,
    required this.description,
    required this.artikel,
    required this.beschreibung,
    required this.artikelClean,
    required this.beschreibungClean,
    required this.prices,
    required this.allergens,
    required this.additives,
    required this.characteristics,
    required this.image,
  });

  final int id;
  final String category;
  final DateTime date;
  final String descriptionClean;
  final String description;
  final String artikel;
  final String beschreibung;
  final String artikelClean;
  final String beschreibungClean;
  final Prices prices;
  final dynamic allergens;
  final dynamic additives;
  final List<Characteristic> characteristics;
  final String image;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    category: json["category"],
    date: DateTime.parse(json["date"]),
    descriptionClean: json["description_clean"],
    description: json["description"],
    artikel: json["artikel"],
    beschreibung: json["beschreibung"],
    artikelClean: json["artikel_clean"],
    beschreibungClean: json["beschreibung_clean"],
    prices: Prices.fromJson(json["prices"]),
    allergens: json["allergens"],
    additives: json["additives"],
    characteristics: List<Characteristic>.from(json["characteristics"].map((x) => Characteristic.fromJson(x))),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "description_clean": descriptionClean,
    "description": description,
    "artikel": artikel,
    "beschreibung": beschreibung,
    "artikel_clean": artikelClean,
    "beschreibung_clean": beschreibungClean,
    "prices": prices.toJson(),
    "allergens": allergens,
    "additives": additives,
    "characteristics": List<dynamic>.from(characteristics.map((x) => x.toJson())),
    "image": image,
  };
}

class AllergensClass {
  AllergensClass({
    required this.the30,
    required this.the36,
    required this.the30A,
    required this.the30C,
    required this.the39,
    required this.the41,
    required this.the35,
    required this.the38,
    required this.the32,
    required this.the30D,
    required this.the40,
    required this.the33,
    required this.the37,
    required this.the37D,
    required this.the34,
    required this.the37A,
    required this.the37C,
    required this.the37B,
    required this.the30E,
  });

  final String the30;
  final String the36;
  final String the30A;
  final String the30C;
  final String the39;
  final String the41;
  final String the35;
  final String the38;
  final String the32;
  final String the30D;
  final String the40;
  final String the33;
  final String the37;
  final String the37D;
  final String the34;
  final String the37A;
  final String the37C;
  final String the37B;
  final String the30E;

  factory AllergensClass.fromJson(Map<String, dynamic> json) => AllergensClass(
    the30: json["30"],
    the36: json["36"],
    the30A: json["30a"],
    the30C: json["30c"],
    the39: json["39"],
    the41: json["41"],
    the35: json["35"],
    the38: json["38"],
    the32: json["32"],
    the30D: json["30d"],
    the40: json["40"],
    the33: json["33"],
    the37: json["37"],
    the37D: json["37d"],
    the34: json["34"],
    the37A: json["37a"],
    the37C: json["37c"],
    the37B: json["37b"],
    the30E: json["30e"],
  );

  Map<String, dynamic> toJson() => {
    "30": the30,
    "36": the36,
    "30a": the30A,
    "30c": the30C,
    "39": the39,
    "41": the41,
    "35": the35,
    "38": the38,
    "32": the32,
    "30d": the30D,
    "40": the40,
    "33": the33,
    "37": the37,
    "37d": the37D,
    "34": the34,
    "37a": the37A,
    "37c": the37C,
    "37b": the37B,
    "30e": the30E,
  };
}

class Characteristic {
  Characteristic({
    required this.abbreviation,
    required this.name,
    required this.image,
  });

  final String abbreviation;
  final String name;
  final String image;

  factory Characteristic.fromJson(Map<String, dynamic> json) => Characteristic(
    abbreviation: json["abbreviation"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "abbreviation": abbreviation,
    "name": name,
    "image": image,
  };
}

class Prices {
  Prices({
    required this.staff,
    required this.guest,
    required this.student,
  });

  final String staff;
  final String guest;
  final String student;

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
    staff: json["staff"],
    guest: json["guest"],
    student: json["student"],
  );

  Map<String, dynamic> toJson() => {
    "staff": staff,
    "guest": guest,
    "student": student,
  };
}
