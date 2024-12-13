import 'package:ecommerce_app/Data/colors.dart';
import 'package:flutter/material.dart';

class RoundTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextInputType inputType;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final void Function(String)? onFieldSubmitted;
  final bool? isPasswordField;
  final TextEditingController textEditingController;
  final String? validatorValue;
  final Function(String)? onChange;

  const RoundTextField(
      {super.key,
      required this.label,
      this.hint,
      required this.inputType,
      this.prefixIcon,
      required this.textEditingController,
      this.isPasswordField,
      this.onFieldSubmitted,
      this.focusNode,
      this.validatorValue,
      this.onChange});

  @override
  State<RoundTextField> createState() => _RoundTextFieldState();
}

class _RoundTextFieldState extends State<RoundTextField> {
  ValueNotifier<bool> passwordVisiblity = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ValueListenableBuilder(
          valueListenable: passwordVisiblity,
          builder: (context, value, child) {
            return TextFormField(
              onChanged: widget.onChange,
              validator: (value) {
                if (value!.isEmpty) {
                  return widget.validatorValue;
                }
                return null;
              },
              onFieldSubmitted: widget.onFieldSubmitted,
              controller: widget.textEditingController,
              keyboardType: widget.inputType,
              focusNode: widget.focusNode,
              obscureText:
                  widget.isPasswordField == true && passwordVisiblity.value,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: AppColors.whiteColor,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: widget.hint,
                labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                prefixIcon: Icon(
                  widget.prefixIcon,
                  color: Colors.grey,
                ),
                suffixIcon: widget.isPasswordField == true
                    ? IconButton(
                        onPressed: () {
                          passwordVisiblity.value = !passwordVisiblity.value;
                        },
                        icon: Icon(
                          passwordVisiblity.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      )
                    : null,
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
