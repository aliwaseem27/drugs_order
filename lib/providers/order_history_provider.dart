import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drugs_order/models/drug_history_model.dart';
import '../models/drug.dart';
import '../repositories/history_respository.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return HistoryRepository(); // Assuming 'isar' is initialized in the main.dart
});

final orderHistoryListProvider = StateNotifierProvider<DrugOrderListNotifier, List<OrderHistory>>((ref) {
  final historyRepository = ref.watch(historyRepositoryProvider);
  final orderHistoryList = DrugOrderListNotifier(historyRepository);
  orderHistoryList.loadDrugOrders();
  return orderHistoryList;
});

class DrugOrderListNotifier extends StateNotifier<List<OrderHistory>> {
  final HistoryRepository _historyRepository;

  DrugOrderListNotifier(this._historyRepository) : super([]);

  void addDrugOrder(DateTime dateTime, List<Drug> drugs) async {
    await _historyRepository.addDrugOrder(dateTime, drugs);
    loadDrugOrders();
  }

  void loadDrugOrders() async {
    final orders = await _historyRepository.loadDrugOrders();
    state = orders;
  }

  void deleteDrugOrder(OrderHistory order) async {
    await _historyRepository.deleteDrugOrder(order);
    loadDrugOrders();
  }

  void deleteAllOrderHistory() async{
    await _historyRepository.deleteAllOrders();
    state = [];
  }
}

final mostRecentOrderProvider = StreamProvider<OrderHistory?>((ref) {
  final historyRepository = ref.watch(historyRepositoryProvider);
  return historyRepository.getMostRecentOrder();
});
