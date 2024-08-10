import 'package:drugs_order/models/drug_history_model.dart';
import 'package:isar/isar.dart';
import '../main.dart';
import '../models/drug.dart';

class HistoryRepository {

  Future<void> addDrugOrder(DateTime dateTime, List<Drug> drugs) async {
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
    });
  }

  Future<List<OrderHistory>> loadDrugOrders() async {
    return await isar.orderHistorys.where().findAll();
  }

// Additional methods for deleting or updating orders can be added here.
}
