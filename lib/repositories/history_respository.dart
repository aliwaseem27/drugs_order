import 'package:drugs_order/models/drug_history_model.dart';
import 'package:isar/isar.dart';
import '../main.dart';
import '../models/drug.dart';

class HistoryRepository {
  Future<void> addDrugOrder(DateTime dateTime, List<Drug> drugs) async {
    final drugOrder = OrderHistory()..dateTime = dateTime;
    // TODO: Change the drug.amount to drug.selectedAmount
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
    return await isar.orderHistorys.where().sortByDateTimeDesc().findAll();
  }

  Stream<OrderHistory?> getMostRecentOrder() {
    return isar.orderHistorys
        .where()
        .sortByDateTimeDesc()
        .watch(fireImmediately: true)
        .map((orders) => orders.isNotEmpty ? orders.first : null);
  }

  Future<void> deleteAllOrders() async {
    await isar.writeTxn(() async {
      await isar.orderHistorys.clear();
      await isar.selectedDrugs.clear();
    });
  }

  Future<void> deleteDrugOrder(OrderHistory order) async {
    await isar.writeTxn(() async {
      for (var selectedDrug in order.drugs) {
        await isar.selectedDrugs.delete(selectedDrug.id);
      }
      await isar.orderHistorys.delete(order.id);
    });
  }
}
