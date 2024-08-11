import 'package:drugs_order/screens/home_screen.dart';
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
    const HomeScreen(),
    const OrderHistoryScreen(),
    const NewOrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
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
