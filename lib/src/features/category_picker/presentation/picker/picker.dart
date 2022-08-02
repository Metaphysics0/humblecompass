import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/constants/initial_selected_category_index.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';
import 'package:humblecompass/src/features/category_picker/presentation/picker/picker_controller.dart';

// ignore: must_be_immutable
class Picker extends ConsumerWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer? debounce;

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
          if (debounce?.isActive ?? false) debounce?.cancel();
          debounce = Timer(DEBOUNCE_DURATION, () {
            onPick(ref, selectedItem);
          });
        },
        children: categoryList,
      ),
    );
  }
}

final List<Widget> categoryList = List<Widget>.generate(
  AVAILABLE_CATEGORIES.length,
  (int index) => Text(AVAILABLE_CATEGORIES[index].name),
);
