import 'package:drugs_order/screens/about_us_screen.dart';
import 'package:drugs_order/screens/navigation_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NavigationScreen(),
    ),
    GoRoute(
      path: AboutUsScreen.routeName,
      builder: (context, state) => const AboutUsScreen(),
    )
  ],
);
