// // ignore_for_file: prefer_const_constructors

// import 'package:blopz/constants/customcolors.dart';
// import 'package:blopz/constants/customtext.dart';
// import 'package:blopz/constants/spacing.dart';
// import 'package:blopz/home.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class RegisterPage extends StatefulWidget {
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
//   final String CompanyName;
//   RegisterPage({
//     this.CompanyName = '',
//   });
// }

// class _RegisterPageState extends State<RegisterPage> {
//   // text controller
//   final _fullNameController = TextEditingController();
//   final _phoneNoController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController(
//       // text: 'ekenedilichukwu',
//       );
//   final _confirmPasswordController = TextEditingController(
//       // text: 'ekenedilichukwu',
//       );

//   Future signUp() async {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return Center(child: CircularProgressIndicator());
//         });
//     if (passwordConfirmed()) {
//       try {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//             email: _emailController.text.trim(),
//             password: _passwordController.text.trim());
//         Navigator.of(context).pop();
//         addUserDetails(_fullNameController.text.trim(),
//             _phoneNoController.text.trim(), _emailController.text.trim());
//       } on FirebaseAuthException catch (e) {
//         (e);
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 content: Text(e.message.toString()),
//               );
//             });
//       }
//     }
//   }

//   Future addUserDetails(
//     String firstName,
//     String lastName,
//     String email,
//   ) async {
//     await FirebaseFirestore.instance.collection('users').add({
//       'first name': firstName,
//       'last name': lastName,
//       'email': email,
//     });
//   }

//   bool passwordConfirmed() {
//     if (_passwordController.text.trim() ==
//         _confirmPasswordController.text.trim()) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         body: SafeArea(
//             child: Center(
//           child: SingleChildScrollView(
//             child: Container(
//               height: size.height,
//               width: size.width,
//               child: Column(
//                 children: [
//                   SizedBox(height: size.height * 0.02),
//                   Card(
//                     elevation: 2,
//                     child: Container(
//                       height: size.height * 0.3,
//                       width: size.width * 0.6,
//                       decoration: BoxDecoration(
//                         color: logoWhiteBackground,
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 20, horizontal: 50),
//                         child: Image.asset(
//                           'assets/images/blopz_logo_single.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.01),
//                   Card(
//                     elevation: 6,
//                     child: Container(
//                       width: size.width * .6,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 5),
//                         child: TextField(
//                           controller: _fullNameController,
//                           decoration: InputDecoration(
//                               prefixIcon: Padding(
//                                 padding:
//                                     const EdgeInsets.only(bottom: 6, left: 5),
//                                 child: Icon(
//                                   Icons.person_outline,
//                                 ),
//                               ),
//                               border: InputBorder.none,
//                               hintText: 'Full name',
//                               hintStyle: regularText),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.01),
//                   Card(
//                     elevation: 6,
//                     child: Container(
//                       width: size.width * .6,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 5),
//                         child: TextField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             prefixIcon: Padding(
//                               padding:
//                                   const EdgeInsets.only(bottom: 6, left: 5),
//                               child: Icon(
//                                 Icons.email_outlined,
//                               ),
//                             ),
//                             border: InputBorder.none,
//                             hintText: 'Email',
//                             hintStyle: regularText,
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.01),
//                   Card(
//                     elevation: 6,
//                     child: Container(
//                       width: size.width * .6,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 5),
//                         child: TextField(
//                           controller: _phoneNoController,
//                           decoration: InputDecoration(
//                             prefixIcon: Padding(
//                               padding:
//                                   const EdgeInsets.only(bottom: 6, left: 5),
//                               child: Icon(
//                                 Icons.phone,
//                               ),
//                             ),
//                             border: InputBorder.none,
//                             hintText: 'Phone No',
//                             hintStyle: regularText,
//                           ),
//                           keyboardType: TextInputType.phone,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.01),
//                   Card(
//                     elevation: 6,
//                     child: Container(
//                       width: size.width * .6,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 5),
//                         child: TextField(
//                           controller: _passwordController,
//                           decoration: InputDecoration(
//                             prefixIcon: Padding(
//                               padding:
//                                   const EdgeInsets.only(bottom: 6, left: 5),
//                               child: Icon(
//                                 Icons.lock,
//                               ),
//                             ),
//                             border: InputBorder.none,
//                             hintText: 'Password',
//                             hintStyle: regularText,
//                           ),
//                           keyboardType: TextInputType.phone,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.01),
//                   Card(
//                     elevation: 6,
//                     child: Container(
//                       width: size.width * .6,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 5),
//                         child: TextField(
//                           controller: _confirmPasswordController,
//                           decoration: InputDecoration(
//                             prefixIcon: Padding(
//                               padding:
//                                   const EdgeInsets.only(bottom: 6, left: 5),
//                               child: Icon(
//                                 Icons.lock,
//                               ),
//                             ),
//                             border: InputBorder.none,
//                             hintText: 'Confirm Password',
//                             hintStyle: regularText,
//                           ),
//                           keyboardType: TextInputType.phone,
//                         ),
//                       ),
//                     ),
//                   ),
//                   minVetSpacing,
//                   widget.CompanyName != ''
//                       ? Card(
//                           elevation: 6,
//                           child: Container(
//                             width: size.width * .6,
//                             child: Padding(
//                                 padding: const EdgeInsets.all(0),
//                                 child: ListTile(
//                                   contentPadding: EdgeInsets.only(left: 10),
//                                   title: Text(
//                                     widget.CompanyName,
//                                   ),
//                                   leading: Icon(
//                                     Icons.business,
//                                   ),
//                                 )),
//                           ),
//                         )
//                       : Container(),
//                   GestureDetector(
//                     onTap: signUp,
//                     child: Card(
//                       elevation: 14,
//                       color: logoOrange.withOpacity(0.6),
//                       child: Container(
//                         width: size.width * .6,
//                         height: size.height * .06,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Center(
//                           child: Text('Sign Up',
//                               style: boldregularText.copyWith(
//                                   color: Colors.black)),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )),
//       ),
//     );
//   }
// }
