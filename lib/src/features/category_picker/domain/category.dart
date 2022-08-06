import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String searchText;
  final String searchType;
  final Icon icon;
  bool? disabled = false;

  Category({
    required this.id,
    required this.name,
    required this.searchText,
    required this.searchType,
    required this.icon,
    this.disabled,
  });
}
