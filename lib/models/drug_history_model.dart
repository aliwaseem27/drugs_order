import 'package:isar/isar.dart';

part "drug_history_model.g.dart";

@collection
class OrderHistory {
  Id id = Isar.autoIncrement;
  late DateTime dateTime;
  final drugs = IsarLinks<SelectedDrug>();
}

@collection
class SelectedDrug {
  Id id = Isar.autoIncrement;
  late String drugName;
  late int selectedAmount;
}
