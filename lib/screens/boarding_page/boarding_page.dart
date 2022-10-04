import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/model_class/config.dart';
import '/screens/home_page/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                  color: Config.BoardingPagecolor1st,
                  urlImage: Config.BoardingPageImage1st,
                  title: 'REDUS',
                  subtitle: Config.BoardingPageImage1st),
              buildPage(
                color: Config.BoardingPagecolor2nd,
                urlImage: Config.BoardingPageImage2nd,
                title: 'REDUS',
                subtitle: Config.BoardingPageDiscrption2st,
              ),
              buildPage(
                color: Config.BoardingPagecolor3rd,
                urlImage: Config.BoardingPageImage3rd,
                title: 'REDUS',
                subtitle: Config.BoardingPageDiscrption3st,
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(60),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () async {
                  // navigator directly to home page
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text('Skip'),
                      onPressed: () => controller.jumpToPage(2),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.teal.shade700,
                        ),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeIn),
                      ),
                    ),
                    TextButton(
                      child: const Text('Next'),
                      onPressed: () => controller.nextPage(
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.easeInOut),
                    ),
                  ],
                ),
              ),
      );

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: 300,
              height: 400,
            ),
            const SizedBox(
              height: 64,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ))
          ],
        ),
      );
}
