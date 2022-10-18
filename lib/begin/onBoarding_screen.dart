import 'package:flutter/material.dart';
import 'package:hackathon/bottom_nav_bar.dart';
import 'package:hackathon/common.dart';
import 'package:hackathon/config/navigation.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class UnboardingContent {
  String image;
  String title;
  UnboardingContent({required this.title, required this.image});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      title: 'Trouver rapidement un service médical et faite vous soigner ',
      image: 'assets/begin1.png'),
  UnboardingContent(
      title:
          'Plus besoins de faire le tour des hôpitaux pour voir le service adapter à vos besoins',
      image: 'assets/begin2.png'),
  UnboardingContent(
      title: 'Gagner du temps et économiser de l’argent ',
      image: 'assets/begin3.png'),
];

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController? _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: contents.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(contents[i].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins')),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            contents[i].image,
                            height: 300,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => buildDot(index, context))),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    NavigateToNextPage(context, buttom_navrbar());
                  }
                  _pageController?.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Pcol,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: Text(currentIndex == contents.length - 1
                    ? 'Continuer'
                    : 'Suivant'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Pcol : Colors.grey[50],
      ),
    );
  }
}
