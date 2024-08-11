import 'package:drugs_order/models/drug_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/drug.dart';
import "router_config.dart";

late Isar isar;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  if (Isar.instanceNames.isEmpty) {
    isar = await Isar.open(
      [DrugSchema, OrderHistorySchema, SelectedDrugSchema],
      directory: dir.path,
    );
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: router,
    );
  }
}
