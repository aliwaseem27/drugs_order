import 'package:drugs_order/providers/drug_list_providers.dart';
import 'package:drugs_order/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/order_history_provider.dart';
import 'widgets/drug_info_tile.dart';
import 'widgets/edit_quantity_button.dart';
import 'widgets/quantity_customizer.dart';

class NewOrderScreen extends ConsumerStatefulWidget {
  const NewOrderScreen({super.key});

  @override
  ConsumerState createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<NewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final drugAsyncValue = ref.watch(drugListProvider);
    final selectedDrugs = ref.watch(selectedDrugsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Make New Order"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              drugAsyncValue.when(
                data: (drugs) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: drugs.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final drug = drugs[index];
                      final isSelected = selectedDrugs.contains(drug);
                      var showQuantity = false;

                      return Container(
                        margin: const EdgeInsets.only(bottom: AppSizes.sm),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Drug Info Tile
                            GestureDetector(
                              onTap: () {
                                if (isSelected) {
                                  ref.read(selectedDrugsProvider.notifier).removeDrug(drug);
                                } else {
                                  ref.read(selectedDrugsProvider.notifier).addDrug(drug);
                                }
                              },
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: DrugInfoTile(
                                        drug: drugs[index],
                                        isSelected: isSelected,
                                      ),
                                    ),
                                    Expanded(
                                      child: EditQuantityButton(
                                        onPressed: () {
                                          setState(() {
                                            showQuantity = !showQuantity;
                                            print("PRESSED $showQuantity");
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Quantity Customizer
                            QuantityCustomizer(show: showQuantity, drug: drugs[index]),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "Are you sure you want to save this order?",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No")),
                            TextButton(
                                onPressed: () {
                                  if (selectedDrugs.isNotEmpty) {
                                    ref
                                        .read(orderHistoryListProvider.notifier)
                                        .addDrugOrder(DateTime.now(), selectedDrugs);
                                    ref.read(selectedDrugsProvider.notifier).clearSelectedDrugs();
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Order Saved Successfully"),
                                  ));
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes")),
                          ],
                        );
                      });
                },
                child: const Text("Save Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
