import 'package:drugs_order/screens/order_history_screen.dart';
import 'package:drugs_order/screens/new_order_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> screens = [
    OrderHistoryScreen(),
    NewOrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Order History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_outlined),
            label: "New Order",
          ),
        ],
      ),
    );
  }
}
