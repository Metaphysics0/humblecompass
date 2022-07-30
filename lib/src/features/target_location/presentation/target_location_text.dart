import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/main.dart';
import 'package:humblecompass/src/features/category_picker/application/handle_selected_category.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';

class TargetLocationText extends ConsumerWidget {
  const TargetLocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Category category = ref.watch(categoryProvider);
    return Text(category.name);
  }
}
