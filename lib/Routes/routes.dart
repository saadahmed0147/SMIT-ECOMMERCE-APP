import 'package:ecommerce_app/Data/product_data.dart';
import 'package:ecommerce_app/Pages/account_screen.dart';
import 'package:ecommerce_app/Pages/cart_screen.dart';
import 'package:ecommerce_app/Pages/checkout_screen.dart';
import 'package:ecommerce_app/Pages/details_screen.dart';
import 'package:ecommerce_app/Pages/home_screen.dart';
import 'package:ecommerce_app/Pages/login_screen.dart';
import 'package:ecommerce_app/Pages/signup_screen.dart';
import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteName.signup:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
      case RouteName.account:
        return MaterialPageRoute(
          builder: (context) => const AccountScreen(),
        );
      case RouteName.cart:
        return MaterialPageRoute(
          builder: (context) =>
              const CartScreen(), // No need to pass cartItems here
        );
      case RouteName.checkout:
        return MaterialPageRoute(
          builder: (context) => const CheckoutScreen(),
        );
      case RouteName.details:
        final product = settings.arguments as Productdetails;
        return MaterialPageRoute(
          builder: (context) => DetailsScreen(product: product),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('No Route Found!'),
              ),
            );
          },
        );
    }
  }
}
