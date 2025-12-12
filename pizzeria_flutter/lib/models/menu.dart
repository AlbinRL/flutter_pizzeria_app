import 'package:flutter/material.dart';

class Menu {
  final String id;
  final String title;
  final String imagePath;
  final Color color;

  const Menu({
    required this.id,
    required this.title,
    required this.imagePath,
    this.color = const Color(0xFFFDF3E0),
  });
}
