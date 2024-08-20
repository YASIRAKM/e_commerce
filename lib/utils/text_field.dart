import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  bool isPassword;
  int maxLines;
  NewTextField(
      {super.key,
      required this.label,
      this.isPassword = false,
      this.maxLines = 1,
      required this.controller});

  @override
  State<NewTextField> createState() => _NewTextFieldState();
}

ValueNotifier<bool> isPswrVisible = ValueNotifier(false);

class _NewTextFieldState extends State<NewTextField> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isPswrVisible,
        builder: (context, value, child) {
          return TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? value : false,
            obscuringCharacter: "*",
            maxLines: widget.maxLines,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                label: Text(widget.label),
                suffix: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          isPswrVisible.value = !value;
                        },
                        child: Icon(value
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash))
                    : null),
          );
        });
  }
}
