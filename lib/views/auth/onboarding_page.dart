import 'package:flutter/material.dart';
import 'package:onboarding_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/onboarding_nav_btn.dart';
import '../../widgets/buttons/my_text_button.dart';
import '../../app_styles.dart';
import '../../model/onboard_data.dart';
import '../../size_configs.dart';
import '../sign_up_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
      duration: Duration(milliseconds: 400),
    );
  }

  @override
  initState() {
    super.initState();
    setSeenOnboard();
  }

  Future setSeenOnboard() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    seenOnboard = await preferences.getBool('seenOnboard');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // ignore: unused_local_variable
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingContents.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: sizeV * 5,
                        ),
                        Text(
                          onboardingContents[index].title,
                          style: kTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: sizeV * 5,
                        ),
                        SizedBox(
                          height: sizeV * 50,
                          child: Image.asset(
                            onboardingContents[index].image,
                          ),
                        ),
                        SizedBox(
                          height: sizeV * 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(style: kBodyText1, children: [
                                TextSpan(text: 'WE CAN'),
                                TextSpan(
                                    text: 'HELP YOU',
                                    style: TextStyle(color: kPrimaryColor)),
                                TextSpan(text: 'TO BE A BETTER'),
                                TextSpan(text: ' VERSION OF '),
                                TextSpan(
                                    text: 'YOURSELF',
                                    style: TextStyle(color: kPrimaryColor)),
                              ])),
                        ),
                        SizedBox(
                          height: sizeV * 5,
                        ),
                      ],
                    );
                  }),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      currentPage == onboardingContents.length - 1
                          ? Expanded(
                              child: MyTextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                buttoName: 'Get Started',
                                bgColor: kPrimaryColor,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OnBoardingNavBtn(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpPage()));
                                  },
                                  name: 'Skip',
                                ),
                                Row(
                                    children: List.generate(
                                  onboardingContents.length,
                                  (index) => dotIndicator(index),
                                )),
                                OnBoardingNavBtn(
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  name: 'Next',
                                ),
                              ],
                            ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
