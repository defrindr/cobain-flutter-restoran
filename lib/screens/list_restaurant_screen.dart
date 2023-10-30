// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:restaurant/components/partial_restaurant.dart';
import 'package:restaurant/data/restaurant.dart';
import 'package:restaurant/misc/static_text.dart';

class ListRestaurantScreen extends StatefulWidget {
  const ListRestaurantScreen({Key? key}) : super(key: key);

  @override
  _ListRestaurantScreenState createState() => _ListRestaurantScreenState();
}

class _ListRestaurantScreenState extends State<ListRestaurantScreen> {
  List<Restaurant> _list_restaurant = [];

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () async {
    getData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final dim = MediaQuery.of(context).size;

    List<Widget> header = [
      SizedBox(height: dim.height * 0.001),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/dashboard.png',
            width: dim.width * 0.9,
            scale: 1,
          )
        ],
      ),
      SizedBox(height: dim.height * 0.001),
      Text(
        StaticText.dashboardTitle,
        style: TextStyle(
          fontSize: dim.height * 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: dim.height * 0.01),
      Text(
        StaticText.dashboardDesc,
        style: TextStyle(
          fontSize: dim.height * 0.025,
        ),
      ),
      SizedBox(height: dim.height * 0.03),
    ];

    List<Widget> dataList = [
      SizedBox(height: dim.height * 0.03),
      ..._list_restaurant.map((restaurant) {
        return PartialRestaurant(restaurant);
      }).toList(),
      SizedBox(height: dim.height * 0.03),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restoran APP'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(dim.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...header,
              ...dataList,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    setState(() {
      _list_restaurant.clear();
    });
    _list_restaurant = await Restaurant.loadRestaurants();
    if (mounted) setState(() {});
  }
}
