import 'package:ecommerce_app/Pages/account_screen.dart';
import 'package:ecommerce_app/Pages/cart_screen.dart';
import 'package:ecommerce_app/Pages/history_screen.dart';
import 'package:ecommerce_app/Pages/home_screen.dart';
import 'package:flutter/material.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectionindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectionindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(_selectionindex),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 255, 255, 255),
        notchMargin: 2.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _onItemTapped(0),
              icon: Icon(
                Icons.home,
                color: _selectionindex == 0
                    ? Colors.black
                    : Colors.grey.withOpacity(0.5),
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(2),
              icon: Icon(
                Icons.favorite_outline_sharp,
                color: _selectionindex == 2
                    ? Colors.black
                    : Colors.grey.withOpacity(0.5),
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(1),
              icon: Icon(
                Icons.history_edu,
                color: _selectionindex == 1
                    ? Colors.black
                    : Colors.grey.withOpacity(0.5),
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(3),
              icon: Icon(
                Icons.person,
                color: _selectionindex == 3
                    ? Colors.black
                    : Colors.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildScreen(int index) {
  switch (index) {
    case 0:
      return const HomeScreen();
    case 1:
      return const CartScreen();
    case 2:
      return const HistoryScreen();
    case 3:
      return const AccountScreen();
    default:
      return const HomeScreen();
  }
}
