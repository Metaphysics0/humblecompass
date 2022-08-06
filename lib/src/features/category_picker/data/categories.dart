import 'package:flutter/material.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart'
    as cat;

// ignore: non_constant_identifier_names
final List<cat.Category> AVAILABLE_CATEGORIES = [
  cat.Category(
    id: "vegan",
    searchType: "restaurant",
    name: "Vegan 🌱",
    searchText: "Vegan Restaurants",
    icon: const Icon(
      Icons.food_bank_rounded,
      color: Colors.amber,
    ),
  ),
  cat.Category(
    id: "coffee",
    searchType: "cafe",
    name: "Coffee Shops ☕️",
    searchText: "Cafes",
    icon: const Icon(
      Icons.coffee,
      color: Colors.amber,
    ),
  ),
  cat.Category(
    id: "coworking_spaces",
    name: "Coworking Spaces 👨🏻‍💻",
    searchText: "Coworking Spaces",
    searchType: "office",
    icon: const Icon(
      Icons.work,
      color: Colors.amber,
    ),
  ),
  cat.Category(
    id: "dance",
    name: "Dance Clubs 🕺",
    searchType: "night_club",
    searchText: "Dance Clubs",
    icon: const Icon(
      Icons.celebration_rounded,
      color: Colors.amber,
    ),
  ),
  cat.Category(
    id: "drinks",
    searchType: "bar",
    name: "Drinks 🍹",
    searchText: "Bars",
    icon: const Icon(
      Icons.local_bar_rounded,
      color: Colors.amber,
    ),
  ),
];
