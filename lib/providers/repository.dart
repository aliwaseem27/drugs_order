import 'package:isar/isar.dart';

import '../main.dart';
import '../models/drug.dart';

class DrugRepository {
  Future<void> init() async {
    // Save predefined list of drugs if the database is empty
    final existingDrugs = await isar.drugs.where().findAll();
    if (existingDrugs.isEmpty) {
      final predefinedDrugs = [
        Drug(name: 'Aspirin', amount: 100),
        Drug(name: 'Paracetamol', amount: 50),
        Drug(name: 'Ibuprofen', amount: 200),
        // Add more drugs as needed
      ];
      await saveDrugs(predefinedDrugs);
    }
  }

  Future<void> saveDrugs(List<Drug> drugs) async {
    await isar.writeTxn(() async {
      await isar.drugs.clear();
      await isar.drugs.putAll(drugs);
    });
  }

  Future<List<Drug>> getDrugs() async {
    return await isar.drugs.where().findAll();
  }
}
