import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/constants/initial_selected_category_index.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';

final categoryProvider =
    StateNotifierProvider<CategorySelector, Category>((ref) {
  return CategorySelector();
});

class CategorySelector extends StateNotifier<Category> {
  CategorySelector()
      : super(AVAILABLE_CATEGORIES[INITIAL_SELECTED_CATEGORY_INDEX]);

  void select(Category category) {
    state = category;
  }
}
