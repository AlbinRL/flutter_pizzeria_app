import 'pizza.dart';
import 'option_item.dart';

class PizzaData {
  static List<Pizza> getPizzas() {
    final pates = [
      OptionItem(name: 'Fine', supplement: 0.0),
      OptionItem(name: 'Epaisse', supplement: 1.5),
    ];
    final tailles = [
      OptionItem(name: 'Petite', supplement: 0.0),
      OptionItem(name: 'Moyenne', supplement: 2.0),
      OptionItem(name: 'Grande', supplement: 4.0),
    ];
    final sauces = [
      OptionItem(name: 'Tomate classique', supplement: 0.0),
      OptionItem(name: 'Tomate épicée', supplement: 0.5),
      OptionItem(name: 'Crème', supplement: 0.7),
    ];

    return [
      Pizza(
        id: 'p1',
        title: 'Barbecue',
        imagePath: 'assets/images/pizzas/pizza-bbq.jpg',
        description: 'Viande hachée, oignons, sauce barbecue.',
        basePrice: 8.5,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
      Pizza(
        id: 'p2',
        title: 'Capres',
        imagePath: 'assets/images/pizzas/pizza-capers.png',
        description: 'Anchois, câpres, olives, mozzarella.',
        basePrice: 10.0,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
      Pizza(
        id: 'p3',
        title: 'Francfort',
        imagePath: 'assets/images/pizzas/pizza-frankfurt.png',
        description: 'Saucisses de Francfort, moutarde, oignons.',
        basePrice: 11.5,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
      Pizza(
        id: 'p4',
        title: 'Hawaïenne',
        imagePath: 'assets/images/pizzas/pizza-hawai.jpg',
        description: 'Jambon, ananas, mozzarella.',
        basePrice: 10.5,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
      Pizza(
        id: 'p5',
        title: 'Salami',
        imagePath: 'assets/images/pizzas/pizza-salami.png',
        description: 'Salami piquant, mozzarella, oignons.',
        basePrice: 9.5,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
      Pizza(
        id: 'p6',
        title: 'Merguez',
        imagePath: 'assets/images/pizzas/pizza-merguez.png',
        description: 'Merguez, poivrons, oignons, sauce piquante.',
        basePrice: 11.0,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
      Pizza(
        id: 'p7',
        title: 'Saucisse',
        imagePath: 'assets/images/pizzas/pizza-sausage.png',
        description: 'Saucisses italiennes, champignons, mozzarella.',
        basePrice: 10.0,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
      Pizza(
        id: 'p8',
        title: 'Épinards',
        imagePath: 'assets/images/pizzas/pizza-spinach.jpg',
        description: 'Épinards frais, fromage de chèvre, ail.',
        basePrice: 9.0,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
      Pizza(
        id: 'p9',
        title: 'Végétarienne',
        imagePath: 'assets/images/pizzas/pizza-vegetable.jpg',
        description: 'Poivrons, oignons, champignons, olives, tomates.',
        basePrice: 8.0,
        pates: pates,
        tailles: tailles,
        sauces: sauces,
      ),
    ];
  }
}
