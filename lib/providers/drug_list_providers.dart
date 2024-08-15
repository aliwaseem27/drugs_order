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

  void addDrug({required String drugName, required int drugAmount}) async {
    final newDrug = Drug(name: drugName, amount: drugAmount);
    await repository.addDrug(newDrug);
    state = AsyncValue.data([...state.value!, newDrug]);
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
    final existingDrugIndex = state.indexOf(drug);

    if (existingDrugIndex != -1) {
      final existingDrug = state[existingDrugIndex];
      final updatedDrug = existingDrug.copyWith(amount: existingDrug.amount);

      state = [
        ...state.sublist(0, existingDrugIndex),
        updatedDrug,
        ...state.sublist(existingDrugIndex + 1),
      ];
    } else {
      state = [...state, drug];
    }
  }

  void updateDrugAmount(Drug drug, int newAmount) {
    final existingDrugIndex = state.indexOf(drug);

    if (existingDrugIndex != -1) {
      final existingDrug = state[existingDrugIndex];
      final updatedDrug = existingDrug.copyWith(amount: newAmount);

      state = [
        ...state.sublist(0, existingDrugIndex),
        updatedDrug,
        ...state.sublist(existingDrugIndex + 1),
      ];
    } else {
      state = [...state, drug.copyWith(amount: newAmount)];
    }
  }

  void removeDrug(Drug drug) {
    state = state.where((d) => d != drug).toList();
  }

  void clearSelectedDrugs() {
    state = [];
  }

  int getDrugAmount(Drug drug) {
    final drugIndex = state.indexOf(drug);
    return state[drugIndex].amount;
  }
}
