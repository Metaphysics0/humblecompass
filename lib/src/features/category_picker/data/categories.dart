import 'package:humblecompass/src/features/category_picker/domain/category.dart'
    as cat;

// ignore: non_constant_identifier_names
final List<cat.Category> AVAILABLE_CATEGORIES = [
  cat.Category(
    id: "vegan",
    searchType: "restaurant",
    name: "Vegan 🌱",
    searchText: "Vegan Restaurants",
  ),
  cat.Category(
    id: "coffee",
    searchType: "cafe",
    name: "Coffee Shops ☕️",
    searchText: "Cafes",
  ),
  cat.Category(
    id: "coworking_spaces",
    name: "Coworking Spaces 👨🏻‍💻",
    searchText: "Coworking Spaces",
    searchType: "office",
  ),
  cat.Category(
    id: "dance",
    name: "Dance Clubs 🕺",
    searchType: "night_club",
    searchText: "Dance Clubs",
  ),
  cat.Category(
    id: "drinks",
    searchType: "bar",
    name: "Drinks 🍹",
    searchText: "Bars",
  ),
];
