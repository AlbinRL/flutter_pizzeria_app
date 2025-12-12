import 'package:flutter/material.dart';
import '../models/pizza.dart';
import '../models/cart.dart';
import 'share/buy_button_widget.dart';
import 'share/total_widget.dart';
import 'share/appbar_widget.dart';
import '../models/option_item.dart';
import '../ui/share/pizzeria_style.dart' as ps;

class PizzaDetails extends StatefulWidget {
  final Pizza pizza;
  final Cart cart;
  const PizzaDetails({Key? key, required this.pizza, required this.cart}) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  late Pizza pizza;

  @override
  void initState() {
    super.initState();
    pizza = widget.pizza;
  }

  Widget _buildDropDown<T extends OptionItem>({
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButton<T>(
      isExpanded: true,
      value: value,
      items: items.map((opt) => DropdownMenuItem<T>(value: opt, child: Text(opt.name))).toList(),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: pizza.title, cart: widget.cart),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pizza.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 220,
                child: Image.asset(pizza.imagePath, fit: BoxFit.cover, errorBuilder: (c, e, st) => const Icon(Icons.image_not_supported)),
              ),
              const SizedBox(height: 10),
              Text('Recette', style: ps.PizzeriaStyle.subtitle),
              const SizedBox(height: 6),
              Text(pizza.description),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pâte'),
                        _buildDropDown<OptionItem>(
                          value: pizza.selectedPate,
                          items: pizza.pates,
                          onChanged: (v) {
                            if (v != null) setState(() => pizza.selectedPate = v);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Taille'),
                        _buildDropDown<OptionItem>(
                          value: pizza.selectedTaille,
                          items: pizza.tailles,
                          onChanged: (v) {
                            if (v != null) setState(() => pizza.selectedTaille = v);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Sauce'),
              _buildDropDown<OptionItem>(
                value: pizza.selectedSauce,
                items: pizza.sauces,
                onChanged: (v) {
                  if (v != null) setState(() => pizza.selectedSauce = v);
                },
              ),
              const SizedBox(height: 12),
              TotalWidget(total: pizza.total),
              const SizedBox(height: 12),
              BuyButtonWidget(pizza: pizza, cart: widget.cart),
            ],
          ),
        ),
      ),
    );
  }
}
