import 'package:flutter/foundation.dart';
import 'package:moleculas_ar/modules/molecule_category/molecule_category_repository.dart';
import 'package:moleculas_ar/shared/models/molecule_model.dart';
import 'package:moleculas_ar/shared/models/molecules_category_model.dart';
import 'package:moleculas_ar/shared/utils/app_state.dart';

class MoleculeCategoryProvider {
  final stateNotifier = ValueNotifier<AppState>(AppState.empty);
  set state(AppState state) => stateNotifier.value = state;
  AppState get state => stateNotifier.value;

  List<MoleculeModel>? molecules;

  final repository = MoleculeCategoryRepository();

  void getMolecules(MoleculeCategories category) async {
    state = AppState.loading;
    molecules = await repository.getMolecules(category);
    state = AppState.success;
  }
}
