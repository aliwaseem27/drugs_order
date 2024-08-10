import 'package:drugs_order/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/order_history_provider.dart';

class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drugOrderList = ref.watch(orderHistoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Drug Order History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: drugOrderList.length,
                itemBuilder: (context, index) {
                  final order = drugOrderList[index];
                  return ExpansionTile(
                    title: Text('Order Date: ${order.dateTime}'),
                    children: order.drugs.map((drugInfo) {
                      return ListTile(
                        title: Text(drugInfo.drugName),
                        subtitle: Text('Amount: ${drugInfo.selectedAmount}'),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
