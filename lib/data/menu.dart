// ignore: file_names
import 'package:restaurant/data/item.dart';

class Menu {
  final List<Item> foods;
  final List<Item> drinks;

  Menu(this.foods, this.drinks);

  factory Menu.fromJson(dynamic json) {
    return Menu(
      json['foods'].map<Item>((dynamic food) => Item.fromJson(food)).toList(),
      json['drinks']
          .map<Item>((dynamic drink) => Item.fromJson(drink))
          .toList(),
    );
  }

  Map toMap() {
    return {
      "foods": foods.map((food) => food.toMap()).toList(),
      "drinks": drinks.map((drink) => drink.toMap()).toList(),
    };
  }
}
