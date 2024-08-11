import 'package:drugs_order/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/order_history_provider.dart';
import '../utils/formatters.dart';

class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drugOrderList = ref.watch(orderHistoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Drug Order History'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Delete All Orders History'),
                      content: Text('Are you sure you want to delete all history?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Long Press to Delete History"),
                              ),
                            );
                          },
                          onLongPress: () {
                            ref.read(orderHistoryListProvider.notifier).deleteAllOrderHistory();
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("History Deleted Successfully"),
                              ),
                            );
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.delete_forever_outlined),
          ),
        ],
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
                  return Card(
                    child: ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order Date: ${Date.format(order.dateTime)}'),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          title: Text('Delete Order History'),
                                          content: Text('Are you sure you want to delete this history?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Cancel')),
                                            TextButton(
                                                onPressed: () {
                                                  ref.read(orderHistoryListProvider.notifier).deleteDrugOrder(order);
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text("History Deleted Successfully"),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  'Delete',
                                                  style: TextStyle(color: Colors.red),
                                                ))
                                          ]);
                                    });
                              },
                              icon: Icon(Icons.remove_circle_outline))
                        ],
                      ),
                      children: order.drugs.map((drugInfo) {
                        return ListTile(
                          title: Text(drugInfo.drugName),
                          trailing: Text('Amount: ${drugInfo.selectedAmount}'),
                        );
                      }).toList(),
                    ),
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
