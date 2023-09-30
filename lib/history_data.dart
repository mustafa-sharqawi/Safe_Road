import 'dart:convert';
import 'package:flutter/material.dart';

ServiceDetailsModel welcomeFromJson(String str) =>
    ServiceDetailsModel.fromJson(json.decode(str));

String welcomeToJson(ServiceDetailsModel data) => json.encode(data.toJson());

class ServiceDetailsModel {
  ServiceDetailsModel({
    @required this.message,
    @required this.data,
  });

  String message = '';
  List<Data> data = [];

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsModel(
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.userId,
    this.text,
    this.date,
  });

  String id;
  String userId;
  String text;
  String date;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        text: json["text"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "text": text,
        "date": date,
      };
}
