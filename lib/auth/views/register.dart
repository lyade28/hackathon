import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/auth/views/login.dart';
import 'package:hackathon/common.dart';
import 'package:hackathon/config/navigation.dart';
import 'package:hackathon/widget/components/button.dart';
import 'package:hackathon/widget/components/select_form_field.dart';
import 'package:hackathon/widget/components/tel_form_field.dart';
import 'package:hackathon/widget/components/text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String initialCountry = 'SN';
  PhoneNumber number = PhoneNumber(phoneNumber: '', isoCode: 'SN');

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  List itemsSexe = ['Masculin', 'Féminin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                      "assets/logo-e-service-sante_logo-e-service-sante-bg-white.png"),
                  const TextCustomFormField(labelText: 'Prénom', maxline: 1),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextCustomFormField(labelText: 'Nom', maxline: 1),
                  const SizedBox(
                    height: 15,
                  ),
                  const TelCustomFormField(label: 'Numéro de Téléphone'),
                  const SizedBox(
                    height: 15,
                  ),
                  inputDate('Date de naissance', 1),
                  const SizedBox(
                    height: 15,
                  ),
                  SelectCustomFormField(
                      items: itemsSexe.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      label: 'Sexe'),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonCustomLarge(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Pcol),
                      label: "S'inscrire",
                      onPressed: () {
                        NavigateToNextPage(context, const LoginScreen());
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonCustomLarge(
                      foregroundColor: MaterialStateProperty.all<Color>(Pcol),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      label: "Se connecter",
                      onPressed: () {
                        NavigateToNextPage(context, const LoginScreen());
                      }),
                ],
              ),
            ),
          ),
        ));
  }

  // type date
  Container inputDate(String labelText, int maxline) {
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
        controller: dateInput,
        validator: (value) {
          if (value != null && value.trim().length < 3) {
            return 'This field requires a minimum of 3 characters';
          }
          return null;
        },
        maxLines: maxline,
        readOnly: true,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: labelText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(0),
            hintStyle: const TextStyle(height: 1),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.grey.shade400,
              ),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            )),
      ),
    );
  }
}
