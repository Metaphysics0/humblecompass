class Category {
  final String id;
  final String name;
  bool? disabled = false;

  Category({
    required this.id,
    required this.name,
    this.disabled,
  });
}
