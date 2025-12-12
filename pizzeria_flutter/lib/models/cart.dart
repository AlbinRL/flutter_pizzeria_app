import 'pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem({required this.pizza, this.quantity = 1});
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void add(Pizza pizza) {
    // On considère l'identité par id + options (simplifié : id only)
    final index = _items.indexWhere((ci) =>
    ci.pizza.id == pizza.id &&
        ci.pizza.selectedPate.name == pizza.selectedPate.name &&
        ci.pizza.selectedTaille.name == pizza.selectedTaille.name &&
        ci.pizza.selectedSauce.name == pizza.selectedSauce.name);

    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(pizza: pizza, quantity: 1));
    }
  }

  void remove(Pizza pizza) {
    _items.removeWhere((ci) => ci.pizza.id == pizza.id);
  }

  void decrement(Pizza pizza) {
    final index = _items.indexWhere((ci) => ci.pizza.id == pizza.id);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
    }
  }

  double get totalHT =>
      _items.fold(0.0, (sum, ci) => sum + ci.pizza.total * ci.quantity);

  double get tva => totalHT * 0.20; // 20% TVA

  double get totalTTC => totalHT + tva;

  int get totalItems => _items.fold(0, (s, i) => s + i.quantity);

  void clear() => _items.clear();
}
