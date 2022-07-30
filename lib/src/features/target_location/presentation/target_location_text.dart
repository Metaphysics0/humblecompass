import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/features/category_picker/application/selected_category_provider.dart';
import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';
import 'package:humblecompass/src/styles/text_styles.dart';

class TargetLocationText extends ConsumerWidget {
  const TargetLocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String?> userLocation = ref.watch(userPositionProvider);

    return userLocation.when(
      data: (pos) => Text(pos!),
      error: (err, stack) => Text('Error: $err'),
      loading: () => _searchText(ref),
    );
    // if (userLocation == null) return _enableLocationServicesText(ref);

    return false ? _searchText(ref) : _foundText(ref);
  }
}

AnimatedTextKit _searchText(WidgetRef ref) {
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

Text _foundText(WidgetRef ref) => Text(
      "Found a nearby ${ref.watch(categoryProvider).searchText.toLowerCase()}!",
      style: textStyles.search,
    );

Text _enableLocationServicesText(WidgetRef ref) => Text(
      "Enable location services to find nearby ${ref.watch(categoryProvider).searchText.toLowerCase()}!",
      style: textStyles.search,
    );
