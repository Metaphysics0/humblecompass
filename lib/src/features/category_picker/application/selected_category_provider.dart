import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/constants/initial_selected_category_index.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/enable_location_services/application/get_user_location.dart';
import 'package:humblecompass/src/features/target_location/application/fetch_target_location.dart';

final categoryProvider =
    StateNotifierProvider<CategorySelector, Category>((ref) {
  return CategorySelector(ref);
});

class CategorySelector extends StateNotifier<Category> {
  CategorySelector(this.ref)
      : super(AVAILABLE_CATEGORIES[INITIAL_SELECTED_CATEGORY_INDEX]);

  Ref ref;

  select(Category category) async {
    final userPosition = ref.watch(userPositionProvider);

    final targetResult = await fetchTargetLocation(userPosition, category);

    print("RESULTS FROM FETCH_TARGET_LOCATION: $targetResult");
    state = category;
  }
}
