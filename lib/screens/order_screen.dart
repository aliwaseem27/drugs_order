import 'package:drugs_order/models/enums.dart';
import 'package:drugs_order/utils/app_sizes.dart';
import 'package:flutter/material.dart';

import '../models/drug.dart';
import 'widgets/drug_info_tile.dart';
import 'widgets/edit_quantity_button.dart';
import 'widgets/quantity_customizer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool show = false;
  bool selected = false;

  final List<Drug> drugs = [
    Drug(name: "paracetamol", quantity: 12, minQuantity: 0, maxQuantity: 20, category: Category.vials),
    Drug(name: "paracetamol", quantity: 12, minQuantity: 0, maxQuantity: 20, category: Category.vials),
    Drug(name: "paracetamol", quantity: 12, minQuantity: 0, maxQuantity: 20, category: Category.vials),
    Drug(name: "paracetamol", quantity: 12, minQuantity: 0, maxQuantity: 20, category: Category.vials),
    Drug(name: "paracetamol", quantity: 12, minQuantity: 0, maxQuantity: 20, category: Category.vials),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, secIndex) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: AppSizes.sm),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Drug Info Tile
                        GestureDetector(
                          onTap: () => setState(() {
                            selected = !selected;
                          }),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: DrugInfoTile(
                                    drug: drugs[secIndex],
                                    isSelected: selected,
                                  ),
                                ),
                                Expanded(
                                  child: EditQuantityButton(
                                    onPressed: () {
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Quantity Customizer
                        QuantityCustomizer(show: show, drug: drugs[secIndex]),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
