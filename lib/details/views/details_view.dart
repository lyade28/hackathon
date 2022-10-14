import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/common.dart';
import 'package:hackathon/localisation/views/map_utils.dart';

class DetailsViewScreen extends StatefulWidget {
  const DetailsViewScreen({Key? key}) : super(key: key);

  @override
  State<DetailsViewScreen> createState() => _DetailsViewScreenState();
}

class ServiceHopital {
  const ServiceHopital({required this.name});
  final String name;
}

const List<ServiceHopital> services = <ServiceHopital>[
  ServiceHopital(name: 'Pédiatrie'),
  ServiceHopital(name: 'Chirurgie Orthopédique'),
  ServiceHopital(name: 'Traumatologie'),
  ServiceHopital(name: 'Neurochirurgie'),
  ServiceHopital(name: 'Chirurgie Viscérale'),
  ServiceHopital(name: 'Urologie'),
  ServiceHopital(name: 'Gynécologie Obstétrique'),
  ServiceHopital(name: 'Tête et Cou'),
  ServiceHopital(name: 'Urgences'),
  ServiceHopital(name: 'Anesthésie'),
  ServiceHopital(name: 'Hémodialyse'),
  ServiceHopital(name: 'Réanimation')
];

class _DetailsViewScreenState extends State<DetailsViewScreen> {
  final double coverHeight = 220;
  final double profilHeight = 60;
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
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
          top: top,
          left: 20,
          right: 20,
          child: buildServiceName(),
        ),
      ],
    );
  }

  Widget buildContent() {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: Column(
              children: [
                const ListTile(
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black45,
                    ),
                    title: Text('1, avenue Nelson Mandela'),
                    subtitle: Text('B.P. 3006 – Dakar')),
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
                      children: const [
                        Icon(
                          Icons.phone_in_talk_sharp,
                          color: Colors.black45,
                        ),
                        Text(' 33 839 50 50'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      width: 2,
                      child: Container(color: Colors.black38),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.fax_outlined,
                          color: Colors.black45,
                        ),
                        Text(' 33 839 50 88')
                      ],
                    ),
                  ],
                )),
          ),
          const Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(
                Icons.mail_outline_outlined,
                color: Colors.black45,
              ),
              title: Text('hopital.principal@hpd.sn'),
            ),
          ),
          Card(
            elevation: 2,
            child: _buildPanel(),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.red,
            width: w,
            height: 200,
            child: Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(services.length, (index) {
                    return Center(child: Text(services[index].name));
                  })
                  // crossAxisCount: 2,
                  // mainAxisSpacing: 20,
                  // childAspectRatio: 10 / 3,
                  // crossAxisSpacing: 20,
                  // children: [
                  //   Container(
                  //     color: Colors.white,
                  //     child: ListTile(
                  //       title: Text('Chirugie'),
                  //     ),
                  //   ),
                  // ],
                  ),
            ),
          ),
          // Card(
          //   elevation: 2,
          //   child: Container(
          //       color: Colors.white,
          //       width: w,
          //       padding: const EdgeInsets.all(12.0),
          //       child: Column(
          //         children: [
          //           Text('Autres Services',
          //               textAlign: TextAlign.center,
          //               style: GoogleFonts.poppins(
          //                   color: Colors.black,
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500)),
          //         ],
          //       )),
          // )
        ],
      ),
    );
  }

// Bacground color
  Widget builCoverBackground() {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          width: w,
          height: coverHeight,
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
            Text('Hôpital Principal de Dakar (HPD)',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ]),
        ),
      ],
    );
  }

// Stack service
  Widget buildServiceName() {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Pcol,
      ),
      width: w,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.all(10.0),
      child: Text('OPHTALMOLOGIE',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
    );
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
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    trailing: Text('08h00 - 19h00',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w600))),
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
