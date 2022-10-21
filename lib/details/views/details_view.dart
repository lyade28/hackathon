import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/common.dart';
import 'package:hackathon/config/navigation.dart';
import 'package:hackathon/localisation/views/map_screen.dart';
import 'package:hackathon/localisation/views/map_utils.dart';
import 'package:hackathon/rendez-vous/views/rendez_vous_form_screen.dart';
import 'package:hackathon/search/models/hospital.dart';

class DetailsViewScreen extends StatefulWidget {
  const DetailsViewScreen({Key? key}) : super(key: key);

  @override
  State<DetailsViewScreen> createState() => _DetailsViewScreenState();
}

class _DetailsViewScreenState extends State<DetailsViewScreen> {
  final double coverHeight = 220;
  final double profilHeight = 60;
  bool active = false;
  @override
  Widget build(BuildContext context) {
    // final hospital = ModalRoute.of(context)!.settings.arguments as Hospital;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[buildTop(), buildContent()],
      ),
    ));
  }

  Widget buildTop() {
    final top = coverHeight - profilHeight / 2;
    final bottom = profilHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: builCoverBackground(),
        ),
        Positioned(
          top: top + 50,
          left: 20,
          right: 20,
          child: buildServiceName(),
        ),
      ],
    );
  }

  Widget buildContent() {
    final hospital = ModalRoute.of(context)!.settings.arguments as Hospital;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black45,
                  ),
                  title: Text(hospital.lieu),
                  subtitle: Text(hospital.rue),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: _viewMap(),
                )
              ],
            ),
          ),
          Card(
            elevation: 2,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_in_talk_sharp,
                          color: Colors.black45,
                        ),
                        Text(hospital.telephone),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      width: 2,
                      child: Container(color: Colors.black38),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.fax_outlined,
                          color: Colors.black45,
                        ),
                        Text(hospital.fax)
                      ],
                    ),
                  ],
                )),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(
                Icons.mail_outline_outlined,
                color: Colors.black45,
              ),
              title: Text(hospital.email),
            ),
          ),
          Card(
            elevation: 2,
            child: _buildPanel(),
          ),
          const SizedBox(
            height: 16,
          ),
          Card(
            elevation: 2,
            child: Container(
                color: Colors.white,
                width: w,
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text('Autres Services',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 5.0,
                        children: [
                          ...List.generate(
                              hospital.services.length,
                              (index) => Chip(
                                    label: Text(hospital.services[index].nom),
                                    padding: const EdgeInsets.all(8.0),
                                  ))
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

// Bacground color
  Widget builCoverBackground() {
    double w = MediaQuery.of(context).size.width;
    final hospital = ModalRoute.of(context)!.settings.arguments as Hospital;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          width: w,
          height: coverHeight + 40,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Pcol,
                  Color.fromARGB(255, 178, 221, 231),
                ],
                stops: [
                  0.0,
                  1.0
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                tileMode: TileMode.repeated),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
                child: CircleAvatar(
              radius: 63,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                  backgroundImage: const AssetImage('assets/hpd.png'),
                  backgroundColor: Colors.greenAccent,
                  radius: profilHeight,
                  child: const Material(
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.red,
                  )),
            )),
            const SizedBox(
              height: 10,
            ),
            Text(hospital.nom,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            Text('Ophtalmologie',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Scol,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .8)),
          ]),
        ),
      ],
    );
  }

// Stack service
  Widget buildServiceName() {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          final hospital =
              ModalRoute.of(context)!.settings.arguments as Hospital;
          if (hospital.reservation == true) {
            NavigateToNextPage(context, const RendezVousFormScreen());
          } else {
            _dialogBuilder(context);
          }
        },
        style: TextButton.styleFrom(backgroundColor: Pcol),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
            ),
            Text(
              ' RÉSERVER UN RENDEZ-VOUS',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: .8,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
    // Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     color: Pcol,
    //   ),
    //   width: w,
    //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    //   margin: const EdgeInsets.all(10.0),
    //   child: Text('Traumatologie',
    //       textAlign: TextAlign.center,
    //       style: GoogleFonts.poppins(
    //           color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
    // );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (index, expanded) {
        setState(() {
          active = !active;
        });
      },
      children: <ExpansionPanel>[
        ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const ListTile(
                leading: Icon(
                  Icons.access_time_outlined,
                  color: Colors.black45,
                ),
                title: Text('Horaires'),
              );
            },
            body: Column(
              children: [
                ListTile(
                    title: Text('Lundi',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    trailing: Text('08h00 - 19h00',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w600))),
                ListTile(
                    title: Text('Mardi',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    trailing: Text('08h00 - 19h00',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal))),
                ListTile(
                    title: Text('Mercredi',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    trailing: Text('08h00 - 19h00',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal))),
                ListTile(
                    title: Text('Jeudi',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    trailing: Text('08h00 - 19h00',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal))),
                ListTile(
                    title: Text('Vendredi',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    trailing: Text('08h00 - 19h00',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal))),
                ListTile(
                    title: Text('Samedi',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    trailing: Text('08h00 - 19h00',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal))),
                ListTile(
                    title: Text('Dimanche',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    trailing: Text('09h30 - 15h00',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)))
              ],
            ),
            isExpanded: active),
      ],
    );
  }

  Widget _viewMap() {
    final hospital = ModalRoute.of(context)!.settings.arguments as Hospital;
    return DottedBorder(
      color: Pcol,
      dashPattern: const [8, 4],
      strokeWidth: 1.2,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: const Radius.circular(5),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              MapUtils.openMap(14.6573471, -17.4367247);
              // NavigateToNextPage(context, const MapScreen());
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(.9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.map_outlined,
                  color: Pcol,
                ),
                Text(
                  ' Voir la carte',
                  style: GoogleFonts.poppins(
                      color: Pcol, fontWeight: FontWeight.w600),
                )
              ],
            ),
          )),
    );
  }
}

// Dialog non reservable
Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
          title: Text('Réservation en ligne'),
          content: Text(
            'Cet établissement de sante n’est pas encore reservable. Appelez-le directement pour prendre un RDV.',
            textAlign: TextAlign.center,
          ));
    },
  );
}
