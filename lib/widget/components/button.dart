import 'package:flutter/material.dart';

class ButtonCustomLarge extends StatelessWidget {
  const ButtonCustomLarge(
      {Key? key,
      this.onPressed,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.label})
      : super(key: key);
  final Function()? onPressed;
  final MaterialStateProperty<Color?>? foregroundColor;
  final MaterialStateProperty<Color?>? backgroundColor;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // backgroundColor: MaterialStateProperty.all<Color>(Pcol),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)))),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
