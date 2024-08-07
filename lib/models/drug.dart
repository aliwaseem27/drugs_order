import 'enums.dart';

class Drug {
  late int? id;
  String name;
  int quantity;
  int minQuantity;
  int maxQuantity;
  Category category;

  Drug({
    this.id,
    required this.name,
    required this.quantity,
    required this.minQuantity,
    required this.maxQuantity,
    required this.category,
  });
}
