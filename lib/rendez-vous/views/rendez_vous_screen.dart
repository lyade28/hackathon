import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/common.dart';
import 'package:hackathon/config/navigation.dart';
import 'package:hackathon/search/views/Search.dart';

class RendezVousScreen extends StatefulWidget {
  const RendezVousScreen({Key? key}) : super(key: key);

  @override
  State<RendezVousScreen> createState() => _RendezVousScreenState();
}

class _RendezVousScreenState extends State<RendezVousScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_month,
                color: Pcol,
                size: 48,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Aucun rendez-vous à venir',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Trouvez un praticien et prenez en ligne à tout moment',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5 + 20,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    NavigateToNextPage(context, const SearchPage());
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Pcol, shape: StadiumBorder()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Text(
                        'Prendre un rendez-vous',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
