import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String name;
  final int id;
  final int quantity;
  final String imageUrl;
  final String price;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    Key? key,
    required this.name,
    required this.id,
    required this.quantity,
    required this.imageUrl,
    required this.price,
    this.color, required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color[100],
            borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          //image
          Image.asset(
              imageUrl,
              height: 64,

          ),

          //item name
          Text(name),

          //price + button
          MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\$$price',
                style:  const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
          )

        ]),
      ),
    );
  }

}
