import 'package:drugs_order/providers/order_history_provider.dart';
import 'package:drugs_order/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/formatters.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mostRecentOrder = ref.watch(mostRecentOrderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your latest Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              mostRecentOrder.when(
                data: (data) {
                  if (data != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date: ${Date.format(data.dateTime)}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.drugs.length,
                          itemBuilder: (context, index) {
                            final drug = data.drugs.elementAt(index);
                            return Card(
                              child: ListTile(
                                dense: true,
                                leading: Text(index.toString()),
                                title: Text(
                                  drug.drugName,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                trailing: Text("Amount: ${drug.selectedAmount}"),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text("No Orders yet"));
                  }
                },
                error: (error, stacktrace) {
                  return const Center(child: Text("Something went wrong"));
                },
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
