import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:ecommerce_app/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
