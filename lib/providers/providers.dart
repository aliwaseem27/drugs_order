import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/drug.dart';
import 'repository.dart';

// Predefined list of drugs
final drugRepositoryProvider = Provider<DrugRepository>((ref) {
  final drugRepository = DrugRepository();
  drugRepository.init();
  return drugRepository;
});

// Provider for the list of drugs
final drugListProvider = FutureProvider<List<Drug>>((ref) async {
  final repository = ref.watch(drugRepositoryProvider);
  return await repository.getDrugs();
});

// Provider for selected drugs
final selectedDrugsProvider = StateNotifierProvider<SelectedDrugsNotifier, List<Drug>>((ref) {
  return SelectedDrugsNotifier();
});

class SelectedDrugsNotifier extends StateNotifier<List<Drug>> {
  SelectedDrugsNotifier() : super([]);

  void addDrug(Drug drug) {
    state = [...state, drug];
  }

  void removeDrug(Drug drug) {
    state = state.where((d) => d.name != drug.name).toList();
  }
}
