import 'package:flutter/material.dart';

class ServiceModel {
  String message = '';
  List<Data> data = [];

  ServiceModel({@required this.message, @required this.data});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
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
    data['message'] = this.message;
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
  String id = '';
  String userId = '';
  String text = '';
  String date = '';

  Data({
    @required this.id,
    @required this.userId,
    @required this.text,
    @required this.date,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    text = json['text'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['text'] = this.text;
    data['date'] = this.date;

    return data;
  }
}
