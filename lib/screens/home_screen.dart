import 'package:drugs_order/providers/order_history_provider.dart';
import 'package:drugs_order/screens/about_us_screen.dart';
import 'package:drugs_order/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../utils/formatters.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mostRecentOrder = ref.watch(mostRecentOrderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your latest Order"),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AboutUsScreen.routeName);
            },
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: "About Us",
          ),
        ],
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
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: ListTile(
                                      dense: true,
                                      leading: Text(index.toString()),
                                      title: Text(
                                        drug.drugName,
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(right: AppSizes.sm),
                                      child: Text(
                                        "${drug.selectedAmount}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
                                      ),
                                    ),
                                  )
                                ],
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
