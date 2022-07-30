import 'package:flutter/cupertino.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: CupertinoPicker(
        itemExtent: 33.0,
        squeeze: 1.1,
        scrollController: FixedExtentScrollController(initialItem: 2),
        useMagnifier: true,
        onSelectedItemChanged: (int selectedItem) {
          print("SELECTED ITEM $selectedItem");
        },
        children: categoryList(),
      ),
    );
  }
}

List<Widget> categoryList() =>
    List<Widget>.generate(AVAILABLE_CATEGORIES.length, (int index) {
      final category = AVAILABLE_CATEGORIES[index];
      return Text(category.name);
    });
