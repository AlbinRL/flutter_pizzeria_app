import 'package:flutter/material.dart';
import 'models/menu.dart';
import 'models/cart.dart';
import 'ui/pizza_list.dart';
import 'ui/share/appbar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzéria',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MyHomePage(title: 'Notre pizzéria'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Cart cart = Cart();

  final List<Menu> menus = const [
    Menu(id: 'm_pizzas', title: 'Pizzas', imagePath: 'assets/images/menus/pizza.png', color: Color(0xFFFFF8E1)),
    Menu(id: 'm_boissons', title: 'Boissons', imagePath: 'assets/images/menus/boisson.png', color: Color(0xFFE8F5E9)),
    Menu(id: 'm_desserts', title: 'Desserts', imagePath: 'assets/images/menus/dessert.png', color: Color(0xFFFFEBEE)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.title, cart: cart),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          itemCount: menus.length,
          itemExtent: 120,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemBuilder: (context, index) {
            final menu = menus[index];
            return InkWell(
              onTap: () {
                if (menu.id == 'm_pizzas') {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PizzaList(cart: cart)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Menu "${menu.title}" non implémenté')));
                }
              },
              child: Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(color: menu.color, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      height: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12))),
                      child: Image.asset(menu.imagePath, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported)),
                    ),
                    const SizedBox(width: 12),
                    Text(menu.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
