import 'package:flutter/material.dart';
import '../models/cart.dart';
import 'share/appbar_widget.dart';
import 'share/total_widget.dart';

class PanierPage extends StatefulWidget {
  final Cart cart;
  const PanierPage({Key? key, required this.cart}) : super(key: key);

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;
    return Scaffold(
      appBar: AppBar(title: const Text('Panier')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final ci = cart.items[index];
                return ListTile(
                  leading: SizedBox(
                    width: 60,
                    child: Image.asset(ci.pizza.imagePath, fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.image)),
                  ),
                  title: Text(ci.pizza.title),
                  subtitle: Text('Qté: ${ci.quantity} - ${ci.pizza.total.toStringAsFixed(2)} €'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: const Icon(Icons.remove), onPressed: () { setState(() => cart.decrement(ci.pizza)); }),
                      IconButton(icon: const Icon(Icons.delete), onPressed: () { setState(() => cart.remove(ci.pizza)); }),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TotalWidget(total: cart.totalHT),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: Text('TVA: ${cart.tva.toStringAsFixed(2)} €')),
                    Expanded(child: Text('TTC: ${cart.totalTTC.toStringAsFixed(2)} €', textAlign: TextAlign.right)),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cart.items.isEmpty ? null : () {
                      // gestion basique de validation
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Commande validée !')));
                      setState(() => cart.clear());
                    },
                    child: const Text('Valider la commande'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
