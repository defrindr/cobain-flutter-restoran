import 'package:flutter/material.dart';
import 'package:restaurant/data/restaurant.dart';
import 'package:restaurant/misc/static_text.dart';

class DetailRestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  const DetailRestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  _DetailRestaurantScreenState createState() => _DetailRestaurantScreenState();
}

class _DetailRestaurantScreenState extends State<DetailRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    final dim = MediaQuery.of(context).size;
    List<Widget> body = [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(dim.height * 0.02),
            child: Image.network(
              widget.restaurant.image,
              width: dim.width - (dim.height * 0.04),
              scale: 1,
            ),
          )
        ],
      ),
      SizedBox(height: dim.height * 0.01),
      Text(
        widget.restaurant.name,
        style: TextStyle(
          fontSize: dim.height * 0.03,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: dim.height * 0.01),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            size: dim.height * 0.02,
          ),
          SizedBox(width: dim.width * 0.01),
          Text(
            widget.restaurant.city,
            style: TextStyle(
              fontSize: dim.height * 0.02,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      SizedBox(height: dim.height * 0.01),
      Text(
        widget.restaurant.description,
        style: TextStyle(
          fontSize: dim.height * 0.02,
        ),
      ),
      SizedBox(height: dim.height * 0.02),
    ];

    List<Widget> category = [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(dim.width * 0.01),
              width: dim.width * 0.45 - ((dim.width * 0.01) * 2),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: dim.height * 0.02,
                  ),
                  SizedBox(width: dim.width * 0.01),
                  Text(
                    StaticText.category_food,
                    style: TextStyle(
                      fontSize: dim.height * 0.02,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(dim.width * 0.01),
              width: dim.width * 0.45 - ((dim.width * 0.01) * 2),
              child: Row(
                children: [
                  Icon(
                    Icons.local_drink,
                    size: dim.height * 0.02,
                  ),
                  SizedBox(width: dim.width * 0.01),
                  Text(
                    StaticText.category_drink,
                    style: TextStyle(
                      fontSize: dim.height * 0.02,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ];

    List<Widget> content = [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Card(
              elevation: 0,
              child: Container(
                padding: EdgeInsets.all(dim.width * 0.01),
                width: dim.width * 0.45 - ((dim.width * 0.01) * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      widget.restaurant.menu.foods.asMap().entries.map((entry) {
                    int index = entry.key + 1;
                    return Text(index.toString() + ". " + entry.value.name);
                  }).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 0,
              child: Container(
                padding: EdgeInsets.all(dim.width * 0.01),
                width: dim.width * 0.45 - ((dim.width * 0.01) * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.restaurant.menu.drinks
                      .asMap()
                      .entries
                      .map((entry) {
                    int index = entry.key + 1;
                    return Text(index.toString() + ". " + entry.value.name);
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(StaticText.detailRestaurantTitle),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(dim.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...body, ...category, ...content],
        ),
      ),
    );
  }
}
