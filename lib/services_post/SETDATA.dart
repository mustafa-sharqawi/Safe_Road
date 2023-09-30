import 'dart:convert';

import 'package:flutter/material.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    @required this.message,
    @required this.data,
  });

  String message = '';
  List<Data> data = [];

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
    this.status,
    this.image,
    this.category,
    this.subcategory,
    this.commericalRegister,
    this.title,
    this.description,
    this.price,
    this.workHours,
    this.city,
    this.region,
    this.insertDate,
    this.userId,
    this.name,
    this.phone,
  });

  int id;
  int status;
  String image;
  String category;
  String subcategory;
  String commericalRegister;
  String title;
  String description;
  int price;
  int workHours;
  String city;
  String region;
  DateTime insertDate;
  int userId;
  String name;
  int phone;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        status: json["status"],
        image: json["image"],
        category: json["category"],
        subcategory: json["subcategory"],
        commericalRegister: json["commerical_register"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        workHours: json["work_hours"],
        city: json["city"],
        region: json["region"],
        insertDate: DateTime.parse(json["insert_date"]),
        userId: json["user_id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "image": image,
        "category": category,
        "subcategory": subcategory,
        "commerical_register": commericalRegister,
        "title": title,
        "description": description,
        "price": price,
        "work_hours": workHours,
        "city": city,
        "region": region,
        "insert_date":
            "${insertDate.year.toString().padLeft(4, '0')}-${insertDate.month.toString().padLeft(2, '0')}-${insertDate.day.toString().padLeft(2, '0')}",
        "user_id": userId,
        "name": name,
        "phone": phone,
      };
}
