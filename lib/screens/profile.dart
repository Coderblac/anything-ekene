import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:blopz/home.dart';
import 'package:blopz/screens/orders.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            minVetSpacing,
            Center(
              child: Container(
                width: size.width * 0.4,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  gradient: orangeGradient,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            maxVetSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Philip Barry',
                      style: boldHheading,
                    ),
                    Text(
                      'Ekenedilichukwu Motors',
                      style: regularText,
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: logoOrange,
                        borderRadius: BorderRadius.circular(100)),
                    // padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 24,
                        )))
              ],
            ),
            maxVetSpacing,
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).brightness == Brightness.dark
                    ? appBarDarkTheme.withOpacity(1)
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 1,
                    // offset: Offset.fromDirection(-5, 3),
                  ),
                ],
              ),
              height: size.height * 0.25,
              width: size.width * 0.7,
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(itemsList[index]['title']),
                    leading: itemsList[index]['icon'],
                    iconColor: logoOrange,
                    onTap: () {
                      if (index < 2) return;
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return itemsList[index]['return'];
                      }));
                    },
                  );
                }),
                itemCount: itemsList.length,
              ),
            )
          ],
        )),
      ),
    );
  }

  List itemsList = [
    {
      'title': 'sample@example.com',
      'icon': Icon(Icons.email),
      // 'return': HomeScreen()
    },
    {
      'title': '+234 9051525070',
      'icon': Icon(Icons.call),
      'return': Orders(),
    },
    {
      'title': 'Pending Diliveries',
      'icon': Icon(Icons.notifications),
      'return': HomeScreen(),
    },
  ];
}
