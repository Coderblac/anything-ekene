import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? appBarDarkTheme
            : appBarLightTheme,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: size.width * 0.06),
          child: Text(
            'Orders',
            style: appBarText.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 30,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ))
        ],
      ),
      body: Container(
        height: size.height * .87,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: size.height * 0.12,
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              margin: EdgeInsets.symmetric(
                  vertical: 7, horizontal: size.width * .075),
              decoration: BoxDecoration(
                  color: orderTileColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                title: Text(
                  cartItemsList[index]['title'],
                  style: boldregularText.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                trailing: Container(
                  width: size.width * .23,
                  child: Row(
                    children: [
                      Text(
                        cartItemsList[index]['amount'],
                        style: boldregularText.copyWith(
                            fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        '.00',
                        style: boldregularText.copyWith(
                            fontSize: 18,
                            color: orderTileColor.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
                subtitle: Row(children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.dashboard_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          '12 packages',
                          style: tinyText.copyWith(color: Colors.white),
                        ),
                        minHorzSpacing,
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            Text(
                              '22.12.2020',
                              style: tinyText.copyWith(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
            );
          },
          itemCount: cartItemsList.length,
        ),
      ),
    );
  }

  List cartItemsList = [
    {
      'title': 'Lorem Ipsum dolor sit ametcons',
      'amount': '\$1000',
    },
    {
      'title': 'Lorem Ipsum dolor sit ametcons',
      'amount': '\$1000',
    },
    {
      'title': 'Lorem Ipsum dolor sit ametcons',
      'amount': '\$1000',
    },
    {
      'title': 'Lorem Ipsum dolor sit ametcons',
      'amount': '\$1000',
    },
    {
      'title': 'Lorem Ipsum dolor sit ametcons',
      'amount': '\$1000',
    },
    {
      'title': 'Lorem Ipsum dolor sit ametcons',
      'amount': '\$1000',
    },
    {
      'title': 'Lorem Ipsum dolor sit ametcons',
      'amount': '\$1000',
    },
  ];
}
