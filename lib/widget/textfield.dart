import 'package:flutter/material.dart';

class Ctextfield extends StatelessWidget {
  const Ctextfield(
      {super.key,
      this.controller,
      this.hint,
      this.sufix,
      this.keyboardType,
      this.obscureText = false});
  final TextEditingController? controller;
  final String? hint;
  final Widget? sufix;
  final bool? obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        suffixIcon: sufix,
        hintText: hint ?? '',
      ),
      keyboardType: keyboardType,
    );
  }
}
