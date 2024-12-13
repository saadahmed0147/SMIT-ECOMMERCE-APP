import 'package:ecommerce_app/Data/colors.dart';
import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    void _logout() async {
      // Show confirmation dialog before logging out
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("Do you really want to log out?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: TextStyle(
                  color: AppColors.btnColor, // Red color for cancellation
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(
                    context, RouteName.login); // Navigate to login screen
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.red, // Green color for confirmation
                ),
              ),
            ),
          ],
        ),
      );
    }

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
                  onPressed: () {
                    final RenderBox button =
                        context.findRenderObject() as RenderBox;
                    final buttonPosition = button.localToGlobal(
                        Offset.zero); // Get the position of the button

                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        buttonPosition.dy,
                        buttonPosition.dy -
                            50, // Position the menu above the button
                        50,
                        10,
                      ),
                      items: [
                        PopupMenuItem<String>(
                          value: 'Logout',
                          onTap: _logout, // Call logout when tapped
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                  icon: const Icon(Icons.account_circle_outlined),
                ),
                const Text("Account", style: TextStyle(fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }
}
