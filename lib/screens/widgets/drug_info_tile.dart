import 'package:flutter/material.dart';

import '../../models/drug.dart';
import '../../utils/app_sizes.dart';

class DrugInfoTile extends StatelessWidget {
  const DrugInfoTile({
    super.key,
    required this.drug,
    this.isSelected = false,
  });

  final Drug drug;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: AppSizes.xs, top: AppSizes.xs, bottom: AppSizes.xs),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.transparent : Colors.black38,
        ),
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.borderRadiusMd),
          bottomLeft: Radius.circular(AppSizes.borderRadiusMd),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppSizes.xs),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.borderRadiusMd),
                  bottomLeft: Radius.circular(AppSizes.borderRadiusMd),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    drug.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      const Text("Qty: "),
                      Text(
                        drug.amount.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
