import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/constants/initial_selected_category_index.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/application/fetch_target_location.dart';
import 'package:humblecompass/src/features/target_location/application/target_location_provider.dart';
import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';

final categoryProvider =
    StateNotifierProvider<CategorySelector, Category>((ref) {
  return CategorySelector(ref);
});

class CategorySelector extends StateNotifier<Category> {
  CategorySelector(this.ref)
      : super(AVAILABLE_CATEGORIES[INITIAL_SELECTED_CATEGORY_INDEX]);

  Ref ref;

  select(Category category) async {
    final userPosition = await getCurrentPosition();
    final targetResult = await fetchTargetLocation(userPosition!, category);
    ref.read(targetLocationProvider.notifier).setTargetLocation(targetResult);

    state = category;
  }
}
