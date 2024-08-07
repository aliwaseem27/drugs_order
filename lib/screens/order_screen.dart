import 'package:drugs_order/providers/providers.dart';
import 'package:drugs_order/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/drug_info_tile.dart';
import 'widgets/edit_quantity_button.dart';
import 'widgets/quantity_customizer.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drugAsyncValue = ref.watch(drugListProvider);
    final selectedDrugs = ref.watch(selectedDrugsProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              drugAsyncValue.when(
                data: (drugs){
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: drugs.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final drug = drugs[index];
                      final isSelected = selectedDrugs.contains(drug);

                      return Container(
                        margin: const EdgeInsets.only(bottom: AppSizes.sm),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Drug Info Tile
                            GestureDetector(
                              onTap: (){
                                if (isSelected){
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
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Quantity Customizer
                            QuantityCustomizer(show: true, drug: drugs[index]),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                  );
                },
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
