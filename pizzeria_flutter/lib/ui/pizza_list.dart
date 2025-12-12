import 'package:flutter/material.dart';
import '../models/pizza.dart';
import '../models/pizza_data.dart';
import '../models/cart.dart';
import 'pizza_details.dart';
import 'share/appbar_widget.dart';

class PizzaList extends StatefulWidget {
  final Cart cart;
  const PizzaList({Key? key, required this.cart}) : super(key: key);

  @override
  State<PizzaList> createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  late List<Pizza> pizzas;

  @override
  void initState() {
    super.initState();
    pizzas = PizzaData.getPizzas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Nos pizzas', cart: widget.cart),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          final pizza = pizzas[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PizzaDetails(pizza: pizza, cart: widget.cart)),
              ).then((_) => setState(() {}));
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(title: Text(pizza.title)),
                  SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Image.asset(pizza.imagePath, fit: BoxFit.cover, errorBuilder: (c, e, st) => const Center(child: Icon(Icons.image_not_supported))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(pizza.description),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${pizza.basePrice.toStringAsFixed(2)} €'),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: () {
                            widget.cart.add(pizza);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${pizza.title} ajouté au panier')),
                            );
                            setState(() {});
                          },
                          icon: const Icon(Icons.add_shopping_cart),
                          label: const Text('Commander'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
