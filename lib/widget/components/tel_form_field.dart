import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class TelCustomFormField extends StatelessWidget {
  const TelCustomFormField({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    String initialCountry = 'SN';
    PhoneNumber number = PhoneNumber(phoneNumber: '', isoCode: 'SN');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color(0xffeeeeee), blurRadius: 10, offset: Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(.13))),
      child: Stack(
        children: [
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            cursorColor: Colors.black,
            formatInput: false,
            inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
                border: InputBorder.none,
                hintText: label,
                hintStyle:
                    TextStyle(color: Colors.grey.shade500, fontSize: 16)),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            initialValue: number,
          ),
          Positioned(
            left: 98,
            top: 8,
            bottom: 8,
            child: Container(
                height: 48, width: 1, color: Colors.black.withOpacity(.13)),
          )
        ],
      ),
    );
  }
}
