import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SelectCustomFormField extends StatelessWidget {
  const SelectCustomFormField(
      {Key? key, required this.items, required this.label})
      : super(key: key);
  final List<DropdownMenuItem<Object>> items;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 55,
      padding: const EdgeInsets.only(top: 3, left: 15, right: 15, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color(0xffeeeeee), blurRadius: 10, offset: Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(.13))),
      child: FormBuilderDropdown(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          name: label,
          onChanged: (value) {},
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(0),
            hintStyle: const TextStyle(height: 1),
          ),
          items: items),
    );
  }
}
