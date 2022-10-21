import 'package:flutter/material.dart';

class TextCustomFormField extends StatelessWidget {
  const TextCustomFormField(
      {Key? key, required this.labelText, required this.maxline})
      : super(key: key);
  final String labelText;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color(0xffeeeeee), blurRadius: 10, offset: Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(.13))),
      child: TextFormField(
        validator: (value) {
          if (value != null && value.trim().length < 3) {
            return 'This field requires a minimum of 3 characters';
          }
          return null;
        },
        maxLines: maxline,
        decoration: InputDecoration(
            hintText: labelText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(0),
            hintStyle: const TextStyle(height: 1)),
      ),
    );
  }
}
