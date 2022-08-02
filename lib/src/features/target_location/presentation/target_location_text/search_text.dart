import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/styles/text_styles.dart';
import 'package:humblecompass/src/features/category_picker/application/selected_category_provider.dart';

AnimatedTextKit searchText(WidgetRef ref) {
  return AnimatedTextKit(
    animatedTexts: [
      FadeAnimatedText(
        "Searching for nearby ${ref.watch(categoryProvider).searchText.toLowerCase()} ...",
        textStyle: textStyles.search,
        duration: const Duration(milliseconds: 2200),
      ),
    ],
    repeatForever: true,
  );
}
