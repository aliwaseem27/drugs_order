import 'package:isar/isar.dart';

part 'drug.g.dart';

@Collection()
class Drug {
  Id id = Isar.autoIncrement;

  late String name;
  late int amount;
  int selectedAmount = 0;

  Drug({
    required this.name,
    required this.amount,
    this.selectedAmount = 0,
  });
}
