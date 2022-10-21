import 'package:flutter/material.dart';
import 'package:hackathon/common.dart';

import '../../details/views/details_view.dart';
import '../models/hospital.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  List<Hospital> hopitals = allHospital;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Pcol,
          title: const Text('Rechercher un service '),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size(1, 65),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: MediaQuery.of(context).size.width,
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
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: hopitals.length,
              itemBuilder: (context, index) {
                final hopital = hopitals[index];
                return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsViewScreen(),
                          // Pass the arguments as part of the RouteSettings. The
                          // DetailScreen reads the arguments from these settings.
                          settings: RouteSettings(
                            arguments: hopitals[index],
                          ),
                        ),
                      );
                    },
                    leading: Image.asset(
                      hopital.imgpath,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(hopital.nom),
                    subtitle: Wrap(spacing: 10.0, children: [
                      Text(
                        hopital.services[index].nom,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]));

                //  spacing: 10.0,
                // runSpacing: 5.0,
              },
            ))
          ],
        ),
      ),
    );
  }

// Widget getList() {
//  List<Hospital> list = allHospital;
//   ListView myList = new ListView.builder(
//     itemCount: list.length,
//     itemBuilder: (context, index) {
//     return new ListTile(
//       title: new Text(list[index]),
//     );
//   });
//   return myList;
// }
  void searchBook(String query) {
    final suggestions = allHospital.where((hopital) {
      final hospitalTitle = hopital.nom.toLowerCase();
      final input = query.toLowerCase();
      return hospitalTitle.contains(input);
    }).toList();
    setState(() => hopitals = suggestions);
  }
}
