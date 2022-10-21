import 'package:flutter/material.dart';

// button de taille large
SizedBox buttonLarge(BuildContext context,
    {required String textButton,
    required VoidCallback onPressed,
    required Color backgroundColor}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        textButton,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
  );
}

// button de taille medium
SizedBox buttonMedium(BuildContext context,
    {required String textButton,
    required Function() onPressed,
    required Color backgroundColor}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2 - 40,
    height: 40,
    child: ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        textButton,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

SizedBox OutlinebuttonLarge(BuildContext context,
    {required String textButton,
    required VoidCallback onPressed,
    required Color textColor,
    required Color borderColor}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: OutlinedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: Colors.white, side: BorderSide(color: borderColor)),
      child: Text(
        textButton,
        style: TextStyle(fontSize: 21, color: textColor),
      ),
    ),
  );
}

SizedBox OutlinebuttonMedium(BuildContext context,
    {required String textButton,
    required VoidCallback onPressed,
    required Color textColor,
    required Color borderColor}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2 - 40,
    height: 40,
    child: OutlinedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: Colors.white, side: BorderSide(color: borderColor)),
      child: Text(
        textButton,
        style: TextStyle(color: textColor),
      ),
    ),
  );
}
