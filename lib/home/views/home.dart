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
              height: h / 2 - 30,
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
                    child: Text(
                      'LOGO',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Scol),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
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
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 + 20,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        NavigateToNextPage(context, SearchPage());
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
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 100,
                          width: w - 80,
                          decoration: BoxDecoration(
                              color: Color(0xff27BEDB),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Lorem ipsum dolor sit  consectetur adipiscing',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                  height: 80,
                                  width: 90,
                                  decoration: const BoxDecoration()),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 100,
                          width: w - 80,
                          decoration: BoxDecoration(
                              color: const Color(0xffCD5258),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Lorem ipsum dolor sit  consectetur adipiscing',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                  height: 80,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                      // image: DecorationImage(
                                      //     image: Svg('assets/peti_iconsvg'))
                                      // image: DecorationImage(
                                      //     image: AssetImage('assets/petit.png')),
                                      )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Logo vous permet',
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
