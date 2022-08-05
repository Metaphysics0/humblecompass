import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/constants/initial_selected_category_index.dart';
import 'package:humblecompass/src/features/category_picker/data/categories.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';

final bearingProvider = StateNotifierProvider<Bearing, double>((ref) {
  return Bearing();
});

class Bearing extends StateNotifier<double> {
  Bearing() : super(0);

  void setBearing(bearing) => state = bearing;
}
