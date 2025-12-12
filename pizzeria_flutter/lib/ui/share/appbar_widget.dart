import 'package:flutter/material.dart';
import '../../models/cart.dart';
import '../panier.dart'; // we'll create panier.dart as the page path

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Cart cart;

  const AppBarWidget({Key? key, required this.title, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PanierPage(cart: cart)),
                );
              },
            ),
            if (cart.totalItems > 0)
              Positioned(
                right: 6,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Text(
                    cart.totalItems.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
