import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BottomAppBar(
      color: const Color(0xffffffff),
      height: size.height * 0.13,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.home);
                    },
                    icon: const Icon(
                      CupertinoIcons.house_fill,
                      color: Color(0xff67C4A7),
                    )),
                const Text(
                  "Home",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline_sharp)),
                const Text("Wishlist", style: TextStyle(fontSize: 12))
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.history_edu_outlined)),
                const Text("History", style: TextStyle(fontSize: 12))
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle_outlined)),
                const Text("Account", style: TextStyle(fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }
}
