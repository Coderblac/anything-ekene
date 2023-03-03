// ignore_for_file: prefer_const_constructors

import 'package:blopz/auth/SignUpOpt.dart';
import 'package:blopz/auth/registerScreen.dart';
import 'package:blopz/auth/search.dart';
import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
    'Peace Mass Transit',
    'Bonny Way Motors Nigeria Limited',
    'Chisco Transport Limited',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Container(
                  width: size.width * .8,
                  child: TextField(
                    controller: search,
                    onChanged: (value) {
                      matchQuery.clear();
                    },
                    style: TextStyle(color: Colors.black),
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
                        border: UnderlineInputBorder(),
                        hintText: 'Search Company',
                        hintStyle: regularText.copyWith(
                          color: Colors.black.withOpacity(0.2),
                        )),
                  ),
                ),
                midVetSpacing,
                matchQuery.isEmpty && search.text.isEmpty
                    ? Container(
                        height: size.height * 0.65,
                        child: ListView.builder(
                          itemCount: companyNames.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * .075, vertical: 5),
                              child: ListTile(
                                title: Text(
                                  companyNames[index],
                                  style: boldregularText.copyWith(
                                      color: Colors.black),
                                ),
                                leading: Icon(
                                  Icons.business,
                                  color: Colors.black,
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
                              child: Text('No results found',
                                  style: regularText.copyWith(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 20,
                                  )),
                            ),
                          )
                        : Container(
                            height: size.height * 0.65,
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
