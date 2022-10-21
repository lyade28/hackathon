import 'package:flutter/material.dart';
import 'package:hackathon/auth/views/login-confirm.dart';
import 'package:hackathon/common.dart';
import 'package:hackathon/config/navigation.dart';
import 'package:hackathon/widget/components/button.dart';
import 'package:hackathon/widget/components/tel_form_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'SN';
  PhoneNumber number = PhoneNumber(phoneNumber: '', isoCode: 'SN');

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
              // key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                      "assets/logo-e-service-sante_logo-e-service-sante-bg-white.png"),
                  const SizedBox(
                    height: 40,
                  ),
                  const TelCustomFormField(label: 'Numéro de Téléphone'),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonCustomLarge(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Pcol),
                      label: "Confirmer",
                      onPressed: () {
                        NavigateToNextPage(
                            context, const LoginAuthentificator());
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
