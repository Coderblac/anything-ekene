import 'package:blopz/screens/loadscreen.dart';
import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // const OnboardingScreen({ Key? key }) : super(key: key);
  final controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .2,
            ),
            Container(
              height: size.height * 0.4,
              padding: EdgeInsets.all(5),
              child: PageView(
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {
                    currentIndex;
                  });
                },
                controller: controller,
                children: <Widget>[
                  pageWidget(context,
                      mainText: 'Delivery your package Anywhere, Anytime',
                      image: 'assets/images/1.png',
                      subText: 'We cover all Governorates of Nigeria and More'),
                  pageWidget(context,
                      mainText: 'Express and Fast Delivery',
                      image: 'assets/images/3.png',
                      subText:
                          'Fast in Receiving and delivering shipment wit utmost accuracy'),
                  pageWidget(context,
                      mainText: 'Book your shipment',
                      image: 'assets/images/2.png',
                      subText: 'Swift and reliable'),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .041,
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              onDotClicked: (int index) {
                controller.jumpToPage(index);
              },
              effect: JumpingDotEffect(
                activeDotColor: logoOrange,
                dotColor: logoBlue,
                spacing: 8,
                dotHeight: 5,
                dotWidth: 15,
              ),
            ),
            SizedBox(
              height: size.height * .17,
            ),
            Container(
              padding: EdgeInsets.all(5),
              // color: Colors.grey,
              child: currentIndex == 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.slowMiddle);
                          },
                          child: Card(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Previous'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (_) {
                              return Loadscreen();
                            }), (route) => false);
                          },
                          child: Card(
                            color: logoOrange,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              decoration: BoxDecoration(
                                  color: logoOrange,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Text(
                                'Get Started',
                                style: boldregularText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentIndex == 1
                            ? InkWell(
                                onTap: () {
                                  controller.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.slowMiddle);
                                },
                                child: Card(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('Previous'),
                                  ),
                                ),
                              )
                            : Container(),
                        InkWell(
                          onTap: () {
                            controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOutCubicEmphasized);
                          },
                          child: Card(
                            color: logoOrange,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              decoration: BoxDecoration(
                                  color: logoOrange,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Text(
                                'Next',
                                style: boldregularText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageWidget(
    BuildContext context, {
    required String mainText,
    required String image,
    required String subText,
  }) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .5,
      width: size.width * .82,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: size.height * .25,
          width: size.width * .5,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          ),
        ),
        minVetSpacing,
        Container(
          width: size.width * .8,
          child: Column(
            children: [
              Text(
                mainText,
                style: boldregularText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subText,
                textAlign: TextAlign.center,
                style: regularText.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
