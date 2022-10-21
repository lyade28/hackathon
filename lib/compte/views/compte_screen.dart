import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/begin/onBoarding_screen.dart';
import 'package:hackathon/compte/views/edit_compte.dart';

class CompteScreen extends StatefulWidget {
  const CompteScreen({Key? key}) : super(key: key);

  @override
  State<CompteScreen> createState() => _CompteScreenState();
}

class _CompteScreenState extends State<CompteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 90),
        child: Column(
          children: [
            Center(
              child: Text(
                'Profil',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
            ListTile(
              title: const Text('Modifer mon compte'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Edit()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ),
            ListTile(
              title: const Text('Deconnexion'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBoardingScreen()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ),
          ],
        ),
      ),
    );
  }
}
