import 'package:flutter/material.dart';

class ColorBoxWidget extends StatelessWidget {
  final Color color;

  const ColorBoxWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}
