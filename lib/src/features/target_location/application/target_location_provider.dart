// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final targetResultsProvider =
//     StateNotifierProvider<CategorySelector, Category>((ref) {
//   return CategorySelector(ref);
// });

// class CategorySelector extends StateNotifier<Category> {
//   CategorySelector(this.ref)
//       : super(AVAILABLE_CATEGORIES[INITIAL_SELECTED_CATEGORY_INDEX]);

//   Ref ref;

//   storeResults(Category category) async {
//     final userPosition = ref.watch(userPositionProvider);

//     final List<SearchResult>? targetResults = await fetchTargetLocation(
//       userPosition,
//       category.id,
//       category.searchText,
//     );

//     print("RESULTS FROM FETCH_TARGET_LOCATION: $targetResults");
//     state = category;
//   }
// }