import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/common.dart';

class RendezVousFormScreen extends StatefulWidget {
  const RendezVousFormScreen({Key? key}) : super(key: key);

  @override
  State<RendezVousFormScreen> createState() => _RendezVousFormScreenState();
}

class _RendezVousFormScreenState extends State<RendezVousFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  // This function is triggered when the "Save" button is pressed
  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      // And do something here
    }
  }

  List _itemsStatut = [
    'Pédiatrie',
    'Chirurgie Orthopédique',
    'Traumatologie',
    'Neurochirurgie',
    'Chirurgie Viscérale',
    'Urologie',
    'Gynécologie Obstétrique',
    'Tête et Cou',
    'Urgences',
    'Anesthésie',
    'Hémodialyse',
    'Réanimation'
  ];

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
                    height: 40,
                  ),
                  Image.asset(
                      "assets/logo-e-service-sante_logo-e-service-sante-bg-white.png"),
                  Text(
                    'Formulaire de création',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500, color: Pcol),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  inputText('Prénom', 1),
                  const SizedBox(
                    height: 20,
                  ),
                  inputText('Nom', 1),
                  const SizedBox(
                    height: 20,
                  ),
                  inputText('Numéro de Téléphone', 1),
                  const SizedBox(
                    height: 20,
                  ),
                  inputText('Motif', 3),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderDropdown(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'Spécialiste',
                      onChanged: (value) => _onSelectedStatut,
                      decoration: const InputDecoration(
                        labelText: 'Spécialiste',
                        hintText: 'Sélectionner un élément',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5)),
                      ),
                      items: _itemsStatut.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList()),
                  ElevatedButton.icon(
                      onPressed: _saveForm,
                      icon: const Icon(Icons.save),
                      label: const Text('Enregistrer'))
                ],
              ),
            ),
          ),
        ));
  }

  TextFormField inputText(String labelText, int maxline) {
    return TextFormField(
      validator: (value) {
        if (value != null && value.trim().length < 3) {
          return 'This field requires a minimum of 3 characters';
        }
        return null;
      },
      maxLines: maxline,
      decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5))),
    );
  }

  void _onSelectedStatut(String value) {
    // setState(() => 'data.statut[0]' = value);
    print(value);
  }
}
