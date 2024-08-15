import 'package:isar/isar.dart';

part 'drug.g.dart';
// TODO: Add min, max, category info.

@Collection()
class Drug {
  Id id = Isar.autoIncrement;

  late String name;
  late int amount;
  late int minAmount;
  int? maxAmount;

  Drug({
    required this.name,
    required this.amount,
    this.minAmount = 1,
    int? maxAmount,
  }) : maxAmount = maxAmount ?? amount * 10;

  Drug copyWith({String? name, int? amount}) {
    return Drug(
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Drug && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
