import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String? label;
  final String hint;
  final TextInputType inputType;
  final FocusNode? focusNode;
  final IconData prefixIcon;
  final void Function(String)? onFieldSubmitted;
  final bool? isPasswordField;
  final TextEditingController textEditingController;

  const SearchField(
      {super.key,
      this.label,
      required this.hint,
      required this.inputType,
      required this.prefixIcon,
      this.isPasswordField,
      this.onFieldSubmitted,
      this.focusNode,
      required this.textEditingController});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  ValueNotifier<bool> passwordVisiblity = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ValueListenableBuilder(
          valueListenable: passwordVisiblity,
          builder: (context, value, child) {
            return TextFormField(
              onFieldSubmitted: widget.onFieldSubmitted,
              controller: widget.textEditingController,
              keyboardType: widget.inputType,
              focusNode: widget.focusNode,
              obscureText:
                  widget.isPasswordField == true && passwordVisiblity.value,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                labelText: widget.label,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: const TextStyle(color: Colors.black),
                hintText: widget.hint,
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Icon(widget.prefixIcon),
                suffixIcon: widget.isPasswordField == true
                    ? IconButton(
                        onPressed: () {
                          passwordVisiblity.value = !passwordVisiblity.value;
                        },
                        icon: Icon(
                          passwordVisiblity.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      )
                    : null,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            );
          },
        ));
  }
}
