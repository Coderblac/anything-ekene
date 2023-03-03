// ignore_for_file: prefer_const_constructors

import 'package:blopz/auth/loginScreen.dart';
import 'package:blopz/auth/mainscreen.dart';
import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:flutter/material.dart';

class Loadscreen extends StatefulWidget {
  @override
  State<Loadscreen> createState() => _LoadscreenState();
}

class _LoadscreenState extends State<Loadscreen> {
  var _width = 5.0;
  late double _bikeWidth = MediaQuery.of(context).size.width * 0.82;
  bool showCar = true;
  @override
  void initState() {
    // initiateSearch();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _width = MediaQuery.of(context).size.width * 0.82;
        _bikeWidth = MediaQuery.of(context).size.width * 0.82;
      });
    });
    Future.delayed(
        Duration(
          seconds: 1,
        ), () {
      setState(() {
        showCar = false;
        _bikeWidth = 0;
      });
    });

    Future.delayed(Duration(seconds: 4, milliseconds: 98), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return MainPageLogin();
      }));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: purpleGradient,
      body: SafeArea(
        child: Container(
          height: size.height * 1.0,
          width: size.width * 1.0,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.12,
              ),
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Image.asset(
                    'assets/images/blopz_logo_single.png',
                  ),
                ),
              ),
              // SizedBox(height: size.height * 0.05),
              Text(
                'BLOPZ',
                style:
                    boldHheading.copyWith(fontSize: 70, fontFamily: 'Tahoma'),
              ),
              maxVetSpacing,
              maxVetSpacing,
              maxVetSpacing,
              Container(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // AnimatedContainer(
                        //   // Use the properties stored in the State class.
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         width: 70,
                        //         height: 50,
                        //         child: Icon(
                        //           Icons.motorcycle,
                        //           size: 70,
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         height: 5,
                        //       ),
                        //     ],
                        //   ),
                        //   margin: EdgeInsets.only(left: this._bikeWidth),
                        //   decoration: BoxDecoration(),
                        //   // Define how long the animation should take.
                        //   duration: const Duration(seconds: 4),
                        //   // Provide an optional curve to make the animation feel smoother.
                        //   curve: Curves.fastOutSlowIn,
                        // ),
                        AnimatedContainer(
                          // Use the properties stored in the State class.
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/bike_guy.png'),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(left: this._width),
                          decoration: BoxDecoration(),
                          // Define how long the animation should take.
                          duration: const Duration(seconds: 4),
                          // Provide an optional curve to make the animation feel smoother.
                          curve: Curves.fastOutSlowIn,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                'Delivery you can trust...',
                style: regularText.copyWith(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Chicken_Hunter',
                    fontSize: 32),
              )
            ],
          ),
        ),
      ),
    );
  }
}
