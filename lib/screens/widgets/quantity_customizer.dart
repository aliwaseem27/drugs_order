import 'dart:async';

import 'package:drugs_order/providers/drug_list_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/drug.dart';
import '../../utils/app_sizes.dart';

class QuantityCustomizer extends ConsumerStatefulWidget {
  const QuantityCustomizer({
    super.key,
    required this.show,
    required this.drug,
  });

  final bool show;
  final Drug drug;

  @override
  ConsumerState<QuantityCustomizer> createState() => _QuantityCustomizerState();
}

class _QuantityCustomizerState extends ConsumerState<QuantityCustomizer> {
  late double amount;
  Timer? _debounce;

  void _onChangedDebounced() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(selectedDrugsProvider.notifier).updateDrugAmount(widget.drug, amount.toInt());
      print(amount);
    });
  }

  late double minAmount;
  late double maxAmount;
  final numController = TextEditingController();

  @override
  void initState() {
    minAmount = widget.drug.minAmount.toDouble();
    maxAmount = widget.drug.maxAmount?.toDouble() ?? 100;
    amount = widget.drug.amount.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.show,
      child: Container(
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
                  activeColor: Colors.cyan,
                  divisions: 10,
                  value: amount,
                  min: minAmount,
                  max: maxAmount,
                  onChanged: (value) {
                    setState(() {
                      amount = value;
                    });
                    _onChangedDebounced();
                  },
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  showCursor: false,
                  controller: numController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: amount.toInt().toString(),
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                  ),
                  onChanged: (value) {
                    var input = double.tryParse(value);
                    if (input != null && input <= maxAmount && input >= minAmount) {
                      setState(() {
                        amount = input.toDouble();
                      });
                      _onChangedDebounced();
                    } else {
                      numController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid Amount")),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
