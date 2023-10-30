import 'package:flutter/material.dart';
import 'package:restaurant/screens/detail_restaurant_screen.dart';

class PartialRestaurant extends StatefulWidget {
  final dynamic restaurant;

  const PartialRestaurant(this.restaurant, {Key? key}) : super(key: key);

  @override
  _PartialRestaurantState createState() => _PartialRestaurantState();
}

class _PartialRestaurantState extends State<PartialRestaurant> {
  @override
  Widget build(BuildContext context) {
    final dim = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailRestaurantScreen(
              restaurant: widget.restaurant,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: dim.width * 0.3,
              height: dim.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(widget.restaurant.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: dim.width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restaurant.name,
                    style: TextStyle(
                      fontSize: dim.height * 0.025,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: dim.height * 0.01),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: dim.height * 0.02,
                        color: Colors.grey,
                      ),
                      SizedBox(width: dim.width * 0.01),
                      Text(
                        widget.restaurant.city,
                        style: TextStyle(
                          fontSize: dim.height * 0.02,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: dim.height * 0.01),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: dim.height * 0.02,
                        color: Colors.grey,
                      ),
                      SizedBox(width: dim.width * 0.01),
                      Text(
                        widget.restaurant.rating.toString(),
                        style: TextStyle(
                          fontSize: dim.height * 0.02,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
