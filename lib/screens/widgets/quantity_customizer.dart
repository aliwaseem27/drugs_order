import 'package:flutter/material.dart';

import '../../models/drug.dart';
import '../../utils/app_sizes.dart';

class QuantityCustomizer extends StatelessWidget {
  const QuantityCustomizer({
    super.key,
    required this.show,
    required this.drug,
  });

  final bool show;
  final Drug drug;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: Container(
        // height: 40,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppSizes.borderRadiusMd),
            bottomRight: Radius.circular(AppSizes.borderRadiusMd),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Slider(
                  value: 0.5,
                  onChanged: (value) {},
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: drug.quantity.toString(),
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
