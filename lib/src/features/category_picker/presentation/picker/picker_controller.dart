import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/features/category_picker/application/fetch_target_location_service.dart';
import 'package:humblecompass/src/features/category_picker/application/selected_category_provider.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/application/target_location_provider.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';

void onPick(WidgetRef ref, int selectedCategoryIdx) async {
  final Category selectedCategory = AVAILABLE_CATEGORIES[selectedCategoryIdx];
  setCurrentCategory(ref, selectedCategory);

  final targetLocations = await fetchTargetLocation(selectedCategory);
  setTargetLocations(ref, targetLocations);
}

setCurrentCategory(WidgetRef ref, Category selectedCategory) {
  ref.read(categoryProvider.notifier).select(selectedCategory);
}

setTargetLocations(WidgetRef ref, List<TargetLocation?>? locations) {
  ref.read(targetLocationProvider.notifier).setTargetLocations(locations);
}

// ignore: constant_identifier_names
const Duration DEBOUNCE_DURATION = Duration(milliseconds: 800);
