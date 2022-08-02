import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/constants/initial_selected_category_index.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';

final categoryProvider =
    StateNotifierProvider<CategorySelector, Category>((ref) {
  return CategorySelector(ref);
});

class CategorySelector extends StateNotifier<Category> {
  CategorySelector(this.ref)
      : super(AVAILABLE_CATEGORIES[INITIAL_SELECTED_CATEGORY_INDEX]);

  Ref ref;

  select(Category category) async {
    state = category;
  }
}
