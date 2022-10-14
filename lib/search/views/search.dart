import 'package:flutter/material.dart';
import 'package:hackathon/common.dart';

import '../../config/navigation.dart';
import '../../details/views/details_view.dart';
import '../models/hospital.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  final controller = TextEditingController();
  List<Hospital> hopitals = allHospital;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Pcol,
          title: Text('Rechercher un service '),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.50))
                ],
              ),
              // child: Ctextfield(
              //   controller: controller,
              //   keyboardType: TextInputType.text,
              //   hint: 'Nom , établissement',
              //   sufix: const Icon(
              //     Icons.search,
              //   ),
              // ),
              child: TextFormField(
                onChanged: searchBook,
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: 'Nom , établissement',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: hopitals.length,
              itemBuilder: (context, index) {
                final hopital = hopitals[index];
                return ListTile(
                  onTap: () {
                    NavigateToNextPage(context, const DetailsViewScreen());
                  },
                  leading: Image.asset(
                    hopital.imgpath,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(hopital.nom),
                  // subtitle: Text(hopital.services.map((e) {
                  //   // ignore: avoid_print
                  //   print(e)
                  // }).toList();)
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  void searchBook(String query) {
    final suggestions = allHospital.where((hopital) {
      final hospitalTitle = hopital.nom.toLowerCase();
      final input = query.toLowerCase();
      return hospitalTitle.contains(input);
    }).toList();
    setState(() => hopitals = suggestions);
  }
}
