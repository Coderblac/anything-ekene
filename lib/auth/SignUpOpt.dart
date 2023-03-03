import 'package:blopz/auth/professionalOpt.dart';
import 'package:blopz/auth/registerScreen.dart';
import 'package:blopz/auth/searchCompany.dart';
import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:flutter/material.dart';

class SignUpOption extends StatefulWidget {
  @override
  State<SignUpOption> createState() => _SignUpOptionState();
}

class _SignUpOptionState extends State<SignUpOption> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Container(
            height: size.height * 1.0,
            width: size.width * 1.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 2,
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      color: logoWhiteBackground,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      child: Image.asset(
                        'assets/images/blopz_logo_single.png',
                      ),
                    ),
                  ),
                ),
                midVetSpacing,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfessionalOpt();
                      }));
                    },
                    child: Card(
                      color: logoBlue.withOpacity(0.6),
                      elevation: 14,
                      child: Container(
                        width: size.width * .6,
                        height: size.height * .06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Professional',
                            style: boldregularText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                midVetSpacing,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                    child: Card(
                      elevation: 14,
                      color: logoOrange.withOpacity(0.6),
                      child: Container(
                        width: size.width * .6,
                        height: size.height * .06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text('User',
                              style: boldregularText.copyWith(
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
