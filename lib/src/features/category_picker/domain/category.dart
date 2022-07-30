class Category {
  final String id;
  final String name;
  final String searchText;
  final String searchType;
  bool? disabled = false;

  Category({
    required this.id,
    required this.name,
    required this.searchText,
    required this.searchType,
    this.disabled,
  });
}
