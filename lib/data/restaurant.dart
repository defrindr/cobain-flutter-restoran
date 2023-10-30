// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:restaurant/data/menu.dart';

class Restaurant {
  final String _id;
  final String _name;
  final String _description;
  final String _image;
  final String _city;
  final dynamic _rating;
  final Menu _menus;

  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get image => _image;
  String get city => _city;
  dynamic get rating => _rating;
  Menu get menu => _menus;

  Restaurant(this._id, this._name, this._description, this._image, this._city,
      this._rating, this._menus);

  factory Restaurant.fromJson(dynamic json) {
    return Restaurant(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['pictureId'] != null
          ? json['pictureId'] as String
          : "https://www.freeiconspng.com/uploads/no-image-icon-6.png",
      json['city'] as String,
      json['rating'] as dynamic,
      Menu.fromJson(json['menus']),
    );
  }

  Map toMap() {
    return {
      "id": _id,
      "name": _name,
      "description": _description,
      "image": _image,
      "city": _city,
      "rating": _rating,
      "menus": _menus.toMap(),
    };
  }

  static Future<List<Restaurant>> loadRestaurants() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    // array data to object Restaurant
    List<Restaurant> listRestaurant = data['restaurants']
        .map<Restaurant>(
            (dynamic restaurant) => Restaurant.fromJson(restaurant))
        .toList();

    return listRestaurant;
  }
}
