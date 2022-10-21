import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/common.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Modifier Profil',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/test.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: 'Libasse YADE ',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Nom complet',
                  labelText: 'Nom complet',
                  fillColor: Pcol,
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Pcol : Colors.black),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: 'l.yade@isepdiamniadio.edi',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusColor: Pcol,
                  hintText: 'Email',
                  labelText: 'Email',
                  fillColor: Pcol,
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Pcol : Colors.black),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                readOnly: true,
                initialValue: 'Masculin ',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Sexe',
                  labelText: 'Sexe',
                  fillColor: Pcol,
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Pcol : Colors.black),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: '03/06/0000',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Date de Naissance',
                  labelText: 'Date de Naissance',
                  fillColor: Pcol,
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Pcol : Colors.black),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: 'Thiaroye  sur  mer',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Adresse',
                  labelText: 'Adresse',
                  fillColor: Pcol,
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Pcol : Colors.black),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Pcol,
                      elevation: 0,
                    ),
                    child: Text(
                      'Confirmer',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
