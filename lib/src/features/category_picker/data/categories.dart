import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart'
    as cat;

// ignore: non_constant_identifier_names
final List<cat.Category> AVAILABLE_CATEGORIES = [
  cat.Category(id: "vegan", name: "Vegan 🌱"),
  cat.Category(id: "coffee", name: "Coffee Shops ☕️"),
  cat.Category(id: "coworking_spaces", name: "Coworking Space 👨🏻‍💻"),
  cat.Category(id: "dance", name: "Dance Clubs 🕺"),
  cat.Category(id: "drinks", name: "Drinks 🍹"),
];

final List<Widget> categoryList =
    List<Widget>.generate(AVAILABLE_CATEGORIES.length, (int index) {
  final cat.Category category = AVAILABLE_CATEGORIES[index];
  return Text(category.name);
});
