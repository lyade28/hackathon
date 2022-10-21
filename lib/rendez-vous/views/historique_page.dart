import 'package:flutter/material.dart';
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
      'date': 'Mercredi 20 janvier',
      'heure': '11:00 - 12:00',
      'status': 'rejeté',
    },
    {
      'type': 'Consultation Suivi',
      'specialist': 'Dr Mbaye',
      'service': "L'anesthésiologie",
      'date': 'Mercredi 22 janvier',
      'heure': '11:00 - 12:00',
      'status': 'rejeté',
    },
    {
      'type': 'Soins Dentaires',
      'specialist': 'Dr Diop',
      'service': "Cardiologie",
      'date': 'Mercredi 23 janvier',
      'heure': '11:00 - 12:00',
      'status': 'validé',
    },
    {
      'type': 'Première Consultation',
      'specialist': 'Dr Seck',
      'service': 'Ophtalmologie',
      'date': 'Mercredi 25 janvier',
      'heure': '11:00 - 12:00',
      'status': 'rejeté',
    },
    {
      'type': 'Consultation Simple',
      'specialist': 'Dr Diop',
      'service': 'Ophtalmologie',
      'date': 'Mercredi 26 janvier',
      'heure': '11:00 - 12:00',
      'status': 'validé',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
              children: donne
                  .map((item) => Card(
                        shape: const Border(
                            left: BorderSide(color: Scol, width: 2)),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['type'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Spécialiste :  ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        item['specialist'],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Service :  ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        item['service'],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: Colors.grey.shade600,
                                        size: 16,
                                      ),
                                      Text(
                                        item['date'],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // send icon
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(item['status'],
                                      style: TextStyle(
                                          color: item['status'] == 'validé'
                                              ? Colors.green
                                              : Colors.red)),
                                  const SizedBox(
                                    height: 54,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.grey.shade600,
                                        size: 16,
                                      ),
                                      Text(
                                        item['heure'],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
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
