import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/constants/initial_selected_category_index.dart';
import 'package:humblecompass/src/features/category_picker/application/handle_selected_category.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';

// ignore: must_be_immutable
class Picker extends ConsumerWidget {
  CategorySelector categorySelector = CategorySelector();

  Picker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 275,
      child: CupertinoPicker(
        itemExtent: 33.0,
        squeeze: 1.1,
        scrollController: FixedExtentScrollController(
          initialItem: INITIAL_SELECTED_CATEGORY_INDEX,
        ),
        useMagnifier: true,
        onSelectedItemChanged: (int selectedItem) {
          _onSelectedItemChanged(ref, selectedItem);
        },
        children: categoryList,
      ),
    );
  }
}

void _onSelectedItemChanged(WidgetRef ref, int selectedItem) {
  ref
      .read(categoryProvider.notifier)
      .select(AVAILABLE_CATEGORIES[selectedItem]);
}

final List<Widget> categoryList = List<Widget>.generate(
  AVAILABLE_CATEGORIES.length,
  (int index) => Text(AVAILABLE_CATEGORIES[index].name),
);
