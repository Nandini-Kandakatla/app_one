import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController
  const ({super.key});

  @override
  Widget build(BuildContext context) {
  final inputBorder = OutlineInputBorder(
  borderSide: Divider.createBorderSide(context),
  );
  return TextField(
  controller: ,
  decoration: InputDecoration(
  hintText: ,
  border:inputBorder,
  focusedBorder: inputBorder,
  enabledBorder: inputBorder,
  filled: true,
  contentPadding: const EdgeInsets.all(8),
  ),
  keyboardType: ,
  obscureText: ,

  );
  }
}