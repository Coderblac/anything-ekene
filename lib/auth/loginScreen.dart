import 'package:blopz/auth/SignUpOpt.dart';
import 'package:blopz/auth/forgot_pw_page.dart';
import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:blopz/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  // text controller
  //

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    //
    // Show loading circle
    //

    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      (e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
      // Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Card(
              child: Container(
                height: size.height * 1.0,
                width: size.width * 1.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: logoWhiteBackground,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Image.asset(
                          'assets/images/blopz_logo_single.png',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Welcome',
                                style: boldHheading.copyWith(
                                    color: logoOrange, fontSize: 25),
                              ),
                              Container(
                                height: size.height * 0.0025,
                                width: size.width * 0.27,
                                color: logoOrange,
                              )
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.015,
                          ),
                          Text(
                            'Back',
                            style: boldHheading.copyWith(
                                color: Colors.black, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    minVetSpacing,
                    Container(
                      width: size.width * .8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 6, left: 5),
                              child: Icon(
                                Icons.person_outline,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),

                            // labelText: 'Email or Phone number',
                            label: Text('Email or Phone Number'),
                          ),
                        ),
                      ),
                    ),
                    minVetSpacing,
                    Container(
                      width: size.width * .8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 6, left: 5),
                                child: Icon(
                                  Icons.lock_outline,
                                ),
                              ),
                              label: Text('Password'),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ForgotPasswordPage();
                              }));
                            },
                            child: Text(
                              ' Forgot Password?',
                              style: TextStyle(
                                  color: logoBlue, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    minVetSpacing,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: signIn,
                        // () {
                        //   Navigator.pushAndRemoveUntil(context,
                        //       MaterialPageRoute(builder: (_) {
                        //     return HomeScreen();
                        //   }), (route) => false);
                        // },
                        child: Container(
                          decoration: BoxDecoration(
                              color: logoOrange.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          width: size.width * .7,
                          height: size.height * .06,
                          child: Center(
                            child: Text('Login',
                                style: boldregularText.copyWith(
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an Account?'),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpOption();
                            }));
                          },
                          child: Text(
                            ' Register Now',
                            style: TextStyle(
                                color: logoOrange, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.5)),
                          color: Colors.white,
                        ),
                        height: size.height * .055,
                        width: size.width * 0.7,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset('assets/images/google_logo.png'),
                              midHorzSpacing,
                              Container(
                                width: size.width * .4,
                                child: Text(
                                  'Login with Google',
                                  style: boldregularText.copyWith(
                                      color: Colors.black),
                                ),
                              )
                            ]),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.5)),
                          color: Colors.white,
                        ),
                        height: size.height * .055,
                        width: size.width * 0.7,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset('assets/images/facebook.png'),
                              midHorzSpacing,
                              Container(
                                width: size.width * .4,
                                child: Text(
                                  'Login with Facebook',
                                  style: boldregularText.copyWith(
                                      color: Colors.black),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
