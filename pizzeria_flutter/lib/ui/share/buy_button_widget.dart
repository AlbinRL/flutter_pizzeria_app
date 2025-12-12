import 'package:flutter/material.dart';
import '../../models/pizza.dart';
import '../../models/cart.dart';

class BuyButtonWidget extends StatelessWidget {
  final Pizza pizza;
  final Cart cart;

  const BuyButtonWidget({
    Key? key,
    required this.pizza,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () {
        cart.add(pizza);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${pizza.title} ajouté au panier')),
        );
      },
      icon: const Icon(Icons.add_shopping_cart),
      label: const Text('Commander'),
    );
  }
}
