
import 'dart:io';

import 'package:flutter/material.dart';

class SellOrAdvertise {
  static var category;
  static var subCategory;
  static var condition;
}

class City {
  static var city;
  static var region;
}

class text {
  static var phoneController = TextEditingController();
  static var workHoursController = TextEditingController();
  static var commericalRegister = TextEditingController();
  static var titleController = TextEditingController();
  static var descriptionController = TextEditingController();
  static var priceController = TextEditingController();
  static var nameController = TextEditingController();

  static clear()
  {
    phoneController.clear();
    workHoursController.clear();
    commericalRegister.clear();
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    nameController.clear();

  }
}
