import 'package:flutter/cupertino.dart';

class PromotionModel {
  List<Data> data = [];

  PromotionModel({@required this.data});

  PromotionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      var l = <Data>[];
      // data = new List<Data>();
      data = l;
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
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
