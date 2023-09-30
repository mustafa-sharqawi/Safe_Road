import 'dart:convert';
import 'package:flutter/material.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    @required this.data,
  });

  List<Data> data = [];

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.long,
    this.lat,
    this.services,
  });

  int id;
  String long;
  String lat;
  String services;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        long: json["long"],
        lat: json["lat"],
        services: json["services"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "long": long,
        "lat": lat,
        "services": services,
      };
}
