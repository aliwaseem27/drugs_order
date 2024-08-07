import 'package:isar/isar.dart';
import 'drug_collection.dart';

part 'order.g.dart';

@Collection()
class Order {
  Id id = Isar.autoIncrement;
  late DateTime dateTime;

  final selectedDrugs = IsarLinks<DrugCollection>();

}
