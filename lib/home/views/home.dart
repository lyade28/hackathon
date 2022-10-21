import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hackathon/config/navigation.dart';
import 'package:hackathon/common.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../search/views/Search.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    List liste = [
      {
        'path': 'assets/2.svg',
        'text': 'Accéder rapidement au service de vos hôpitaux'
      },
      {'path': 'assets/3.svg', 'text': 'Voir la localisation de vos  hôpitaux'},
      {'path': 'assets/4.svg', 'text': 'Gagner du temps et de l’argent   '},
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              width: w,
              height: h / 2 - 10,
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
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                        "assets/logo-e-service-sante_logo-e-service-sante-bg-tx-white.png",
                        width: 150),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Trouver un service médical sans vous déplacer',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 + 20,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        NavigateToNextPage(context, const SearchPage());
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search,
                            color: Pcol,
                          ),
                          Text(
                            'RECHERCHER',
                            style: GoogleFonts.poppins(
                                color: Pcol, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Pcol.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        width: w / 3.5,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              width: w,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: Svg('assets/hospital.svg'))),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text('23 '),
                            const Text(
                              'Hôpitaux',
                              style: TextStyle(
                                  color: Scol,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Pcol.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: w / 3.5,
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              width: w,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: Svg('assets/clinique.svg'))),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text('39 '),
                            const Text(
                              'Cliniques',
                              style: TextStyle(
                                  color: Scol,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Pcol.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        // height: 100,
                        width: w / 3.5,
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              width: w,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: Svg('assets/dispensaire.svg'))),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text('27 '),
                            const Text(
                              'Dispensaires',
                              style: TextStyle(
                                  color: Scol,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'E-Service Santé vous permet',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Pcol,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                    items: liste
                        .map(
                          (item) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                                image:
                                    DecorationImage(image: Svg(item['path']))),
                            child: Text(item['text']),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
