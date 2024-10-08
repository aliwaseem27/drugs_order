import 'package:drugs_order/utils/default_drugs.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../models/drug.dart';

class DrugRepository {
  Future<void> init() async {
    // Save predefined list of drugs if the database is empty
    final existingDrugs = await getDrugs();
    if (existingDrugs.isEmpty) {
      final predefinedDrugs = DefaultDrugs().getDefaultDrugs;
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

  Future<void> addDrug(Drug drug) async {
    await isar.writeTxn(() async {
      await isar.drugs.put(drug);
    });
  }

  Future<void> removeDrug(Drug drug) async {
    await isar.writeTxn(() async {
      await isar.drugs.delete(drug.id);
    });
  }
}
