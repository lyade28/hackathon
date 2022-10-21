import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon/common.dart';

class HistoriqueRendezVous extends StatefulWidget {
  const HistoriqueRendezVous({super.key});

  @override
  State<HistoriqueRendezVous> createState() => _HistoriqueRendezVousState();
}

class _HistoriqueRendezVousState extends State<HistoriqueRendezVous> {
  List donne = [
    {
      'type': 'Consultation Simple',
      'specialist': 'Dr Fall',
      'service': 'Ophtalmologie',
      'date': 'Mercredi 20 javier',
      'heure': '11:00 - 12:00',
      'status': 'rejeté',
    },
    {
      'type': 'Consultation Simple',
      'specialist': 'Dr Mbaye',
      'service': "L'anesthésiologie",
      'date': 'Mercredi 22 javier',
      'heure': '11:00 - 12:00',
      'status': 'rejeté',
    },
    {
      'type': 'Consultation Simple',
      'specialist': 'Dr Diop',
      'service': "cardiologie",
      'date': 'Mercredi 23 javier',
      'heure': '11:00 - 12:00',
      'status': 'validé',
    },
    {
      'type': 'Consultation Simple',
      'specialist': 'Dr Seck',
      'service': 'Ophtalmologie',
      'date': 'Mercredi 25 javier',
      'heure': '11:00 - 12:00',
      'status': 'rejeté',
    },
    {
      'type': 'Consultation Simple',
      'specialist': 'Dr Diop',
      'service': 'Ophtalmologie',
      'date': 'Mercredi 26 javier',
      'heure': '11:00 - 12:00',
      'status': 'validé',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
              children: donne
                  .map((item) => Card(
                        shape: Border(left: BorderSide(color: Scol, width: 2)),
                        child: Container(
                          padding: EdgeInsets.all(9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['type'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Specialiste :',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          item['specialist'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Service :',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          item['service'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Colors.grey.shade600,
                                        ),
                                        Text(
                                          item['date'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(item['status'],
                                      style: TextStyle(
                                          color: item['status'] == 'validé'
                                              ? Colors.green
                                              : Colors.red)),
                                  const SizedBox(
                                    height: 44,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.grey.shade600,
                                        ),
                                        Text(
                                          item['heure'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
