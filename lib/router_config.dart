import 'package:drugs_order/screens/navigation_screen.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NavigationScreen(),
    ),
  ],
);
