import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/drug.dart';
import '../repositories/drug_repository.dart';

final drugRepositoryProvider = Provider<DrugRepository>((ref) {
  final drugRepository = DrugRepository();
  return drugRepository;
});

// Provider for the list of drugs

final drugListProvider = StateNotifierProvider<DrugListNotifier, AsyncValue<List<Drug>>>((ref) {
  final repository = ref.watch(drugRepositoryProvider);
  final drugNotifier = DrugListNotifier(repository);
  drugNotifier.loadDrugs();
  return drugNotifier;
});

class DrugListNotifier extends StateNotifier<AsyncValue<List<Drug>>> {
  DrugListNotifier(this.repository) : super(const AsyncValue.loading());

  final DrugRepository repository;

  void loadDrugs() async {
    try {
      state = const AsyncValue.loading();
      await repository.init();
      final drugs = await repository.getDrugs();
      state = AsyncValue.data(drugs);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  void addDrug(Drug drug) async {
    await repository.addDrug(drug);
    state = AsyncValue.data([...state.value!, drug]);
  }

  void removeDrug(Drug drug) async {
    await repository.removeDrug(drug);
    state = AsyncValue.data(state.value!.where((d) => d.name != drug.name).toList());
  }
}

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

  void clearSelectedDrugs() {
    state = [];
  }
}
