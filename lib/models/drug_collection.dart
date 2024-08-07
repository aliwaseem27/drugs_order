import 'package:drugs_order/models/order.dart';
import 'package:isar/isar.dart';

import 'enums.dart';

part 'drug_collection.g.dart';

@Collection()
class DrugCollection {
  Id id = Isar.autoIncrement;
  late String name;
  late int amount;
  late int maxAmount;
  late int minAmount;

  @Backlink(to: "selectedDrugs")
  final order = IsarLinks<Order>();

  @enumerated
  late Category category;
}
