// ignore_for_file: prefer_const_constructors

import 'package:blopz/auth/SignUpOpt.dart';
import 'package:blopz/auth/registerScreen.dart';
import 'package:blopz/auth/search.dart';
import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:flutter/material.dart';

class searchCompany extends StatefulWidget {
  @override
  State<searchCompany> createState() => _searchCompanyState();
}

class _searchCompanyState extends State<searchCompany> {
  TextEditingController search = TextEditingController();
  List<String> companyNames = [
    'Premium Eswop',
    'Ifeanyichukwu Motors',
    'Barry\'s Flight',
    'God is Good Motors',
    'Young Shall Grow Motors',
    'ABC Transportation',
    'Ekenedilichukwu Transport',
    'Eastern Mass Transit',
  ];
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
              children: [
                midVetSpacing,
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.4,
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
                midVetSpacing,
                Container(
                  width: size.width * .6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(50)),
                  child: TextField(
                    controller: search,
                    onChanged: (value) {
                      matchQuery.clear();
                    },
                    textAlign: TextAlign.center,
                    onSubmitted: (value) {
                      for (var company in companyNames) {
                        if (company
                            .toLowerCase()
                            .contains(search.text.toLowerCase())) {
                          matchQuery.add(company);
                        }
                        // print('no match');
                      }
                      setState(() {
                        matchQuery;
                      });
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            matchQuery.clear();
                            search.text = '';
                            setState(() {
                              matchQuery;
                              search;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        hintText: 'Search Company',
                        hintStyle: regularText),
                  ),
                ),
                midVetSpacing,
                matchQuery.isEmpty && search.text.isEmpty
                    ? Container(
                        height: size.height * 0.55,
                        child: ListView.builder(
                          itemCount: companyNames.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: logoBlue,
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * .075, vertical: 5),
                              child: ListTile(
                                title: Text(
                                  companyNames[index],
                                  style: boldregularText.copyWith(
                                      color: Colors.white.withOpacity(0.8)),
                                ),
                                leading: Icon(
                                  Icons.business,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return RegisterPage(
                                      CompanyName: companyNames[index],
                                    );
                                  }));
                                },
                              ),
                            );
                          },
                        ),
                      )
                    : matchQuery.isEmpty && search.text.isNotEmpty
                        ? Container(
                            height: size.height * 0.35,
                            child: Center(
                              child: Text('no results found',
                                  style: boldregularText.copyWith(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontStyle: FontStyle.italic,
                                  )),
                            ),
                          )
                        : Container(
                            height: size.height * 0.55,
                            child: ListView.builder(
                              itemCount: matchQuery.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: logoBlue.withOpacity(1),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * .075,
                                      vertical: 5),
                                  child: ListTile(
                                    title: Text(
                                      matchQuery[index],
                                      style: boldregularText.copyWith(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                    leading: Icon(
                                      Icons.business,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return RegisterPage(
                                          CompanyName: matchQuery[index],
                                        );
                                      }));
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  List<String> matchQuery = [];
}
