import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/auth/views/register.dart';
import 'package:hackathon/common.dart';
import 'package:hackathon/config/navigation.dart';
import 'package:hackathon/widget/button.dart';
import 'package:hackathon/widget/components/button.dart';

class RendezVousFormScreen extends StatefulWidget {
  const RendezVousFormScreen({Key? key}) : super(key: key);

  @override
  State<RendezVousFormScreen> createState() => _RendezVousFormScreenState();
}

// map list
List<ExpansionItem> items = <ExpansionItem>[
  ExpansionItem(
      isExpanded: true,
      horaires: [
        Horaire(libelle: '08:00', selected: false),
        Horaire(libelle: '09:30', selected: false)
      ],
      header: 'Jeudi 20 Octobre'),
  ExpansionItem(
      isExpanded: false,
      horaires: [
        Horaire(libelle: '08:00', selected: false),
        Horaire(libelle: '09:30', selected: false),
        Horaire(libelle: '13:30', selected: false)
      ],
      header: 'Vendredi 21 Octobre'),
  ExpansionItem(
      isExpanded: false,
      horaires: [
        Horaire(libelle: '08:00', selected: false),
        Horaire(libelle: '09:30', selected: false)
      ],
      header: 'Lundi 24 Octobre'),
];

// class Expanded
class ExpansionItem {
  bool isExpanded;
  final String header;
  final List<Horaire> horaires;

  ExpansionItem(
      {this.isExpanded = false, required this.horaires, required this.header});
}

class Horaire {
  final String libelle;
  bool selected;
  Horaire({required this.libelle, this.selected = false});
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

  List itemsStatut = [
    'Pédiatrie',
    'Chirurgie Orthopédique',
    'Traumatologie',
    'Neurochirurgie',
    'Réanimation'
  ];

  List itemsConsultation = [
    'Consultation Simple',
    'Consultation Suivi',
    'Première consultation',
    'Urgences',
    'Réanimation'
  ];

  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Pcol,
          title: const Text('Prise de rendez-vous'),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  FormBuilderDropdown(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'Motif',
                      onChanged: (value) => _onSelectedStatut,
                      decoration: const InputDecoration(
                        labelText: 'Motif',
                        hintText: 'Sélectionner le motif de consultation',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5)),
                      ),
                      items: itemsConsultation.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderDropdown(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'Spécialiste',
                      onChanged: (value) => _onSelectedStatut,
                      decoration: const InputDecoration(
                        labelText: 'Spécialiste',
                        hintText: 'Sélectionner le spécialiste',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5)),
                      ),
                      items: itemsStatut.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Date de disponibilité',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w600, color: Pcol),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 0,
                    child: _buildPanel(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonCustomLarge(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Pcol),
                      label: "Confirmation",
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 24.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Confirmation',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: const TextSpan(
                                            text:
                                                'Vous avez pris rendez-vous pour le',
                                            style: TextStyle(
                                                height: 1.5,
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' 03 juin 2022 à 09h30 ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                              TextSpan(
                                                text: ' motif',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              TextSpan(
                                                text: ' Consultation simple',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )
                                            ]),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          buttonMedium(context,
                                              textButton: 'Confirmer',
                                              onPressed: () {
                                            NavigateToNextPage(context,
                                                const RegisterScreen());
                                          },
                                              backgroundColor:
                                                  const Color(0xFF27BEDB)
                                                      .withOpacity(.4)),
                                          OutlinebuttonMedium(context,
                                              textColor: Colors.red,
                                              textButton: 'Annuler',
                                              onPressed: () {
                                            Navigator.pop(context);
                                          }, borderColor: Colors.red)
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                      }),
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
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          items[index].isExpanded = !items[index].isExpanded;
        });
      },
      children: items.map((ExpansionItem item) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.header,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              );
            },
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: [
                      ...List.generate(
                          item.horaires.length,
                          (index) => ChoiceChip(
                                selected: item.horaires[index].selected,
                                backgroundColor:
                                    const Color(0xFF28A7C3).withOpacity(.4),
                                selectedColor: Pcol,
                                labelStyle: TextStyle(
                                  color: item.horaires[index].selected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                label: Text(item.horaires[index].libelle),
                                padding: const EdgeInsets.all(8.0),
                                onSelected: (bool value) {
                                  setState(() {
                                    item.horaires[index].selected =
                                        !item.horaires[index].selected;
                                  });
                                },
                              ))
                    ],
                  ),
                ),
              ],
            ),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }
}
