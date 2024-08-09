import 'package:drugs_order/models/drug_history_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:drugs_order/main.dart';

import '../models/drug.dart';

final orderHistoryListProvider = StateNotifierProvider<DrugOrderListNotifier, List<OrderHistory>>((ref) {
  return DrugOrderListNotifier();
});

class DrugOrderListNotifier extends StateNotifier<List<OrderHistory>> {
  DrugOrderListNotifier() : super([]);

  void addDrugOrder(DateTime dateTime, List<Drug> drugs) async {
    final drugOrder = OrderHistory()..dateTime = dateTime;
    final orderDrugsList = drugs
        .map((drug) => SelectedDrug()
          ..drugName = drug.name
          ..selectedAmount = drug.amount)
        .toList();

    await isar.writeTxn(() async {
      await isar.selectedDrugs.putAll(orderDrugsList);
      await isar.orderHistorys.put(drugOrder);
      drugOrder.drugs.addAll(orderDrugsList);
      await drugOrder.drugs.save();
      state = [...state, drugOrder];
    });
  }

  void loadDrugOrders() async {
    final orders = await isar.orderHistorys.where().findAll();
    state = orders;
  }

// Additional methods for deleting or updating orders can be added here.
}
