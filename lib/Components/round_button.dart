import 'package:ecommerce_app/Data/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final Color backgroundColor;
  final Color foregroundColor;
  final FocusNode? focusNode;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false,
      this.backgroundColor = AppColors.greenColor,
      this.foregroundColor = AppColors.whiteColor,
      this.focusNode});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return widget.loading
        ? const CircularProgressIndicator(
            color: AppColors.whiteColor,
          )
        : SizedBox(
            height: mq.height * 0.05,
            child: ElevatedButton(
              focusNode: widget.focusNode,
              onPressed: widget.onPress,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(fontSize: 15),
                // backgroundColor: widget.backgroundColor,
                // foregroundColor: widget.foregroundColor,
                foregroundColor: AppColors.blackColor,
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: mq.height * 0.02,
                ),
              ),
            ),
          );
  }
}
