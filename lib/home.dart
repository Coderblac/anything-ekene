import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blopz/screens/cart.dart';
import 'package:blopz/screens/homepage.dart';
import 'package:blopz/screens/profile.dart';
import 'package:blopz/screens/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  int currentIndex = 0;
  late List<Widget> screens;
  bool showAppBar = true;

  @override
  void initState() {
    screens = [
      Homepage(),
      Search(),
      Cart(),
      Profile(),
    ];
    super.initState();
  }

  changeNavbar(int index) {
    setState(() {
      currentIndex = index;
      HapticFeedback.lightImpact();
      if (currentIndex == 0) {
        showAppBar = true;
      } else {
        showAppBar = false;
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List drawerListItems = [
    {
      'title': 'Payments',
      'icons': Icon(Icons.credit_card_rounded),
    },
    {
      'title': 'Promotions',
      'icons': Icon(Icons.label_outline_rounded),
    },
    {
      'title': 'History',
      'icons': Icon(Icons.history),
    },
    {
      'title': 'Support',
      'icons': Icon(Icons.chat_rounded),
    },
    {
      'title': 'FAQ',
      'icons': Icon(Icons.info),
    },
    {
      'title': 'LogOut',
      'icons': Icon(Icons.logout),
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          height: size.height * .9,
          child: Column(
            children: [
              maxVetSpacing,
              CircleAvatar(
                radius: 80,
              ),
              Text(
                'Barry Philip',
                style: boldHheading.copyWith(color: logoBlue),
              ),
              Container(
                height: size.height * .6,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: drawerListItems[index]['icons'],
                      title: Text(
                        drawerListItems[index]['title'],
                        style: boldregularText,
                      ),
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Cart();
                          }));
                        } else if (index == 1) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Cart();
                          }));
                        } else if (index == 2) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Cart();
                          }));
                        } else if (index == 3) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Cart();
                          }));
                        } else if (index == 4) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Cart();
                          }));
                        } else if (index == 5) FirebaseAuth.instance.signOut();
                      },
                    );
                  },
                  itemCount: drawerListItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor:
          currentIndex == 2 ? Color.fromRGBO(37, 167, 223, 1) : null,
      appBar: AppBar(
        backgroundColor: currentIndex == 2
            ? Color.fromRGBO(18, 118, 188, 1)
            : Theme.of(context).brightness == Brightness.dark
                ? appBarDarkTheme
                : appBarLightTheme,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: currentIndex == 2
              ? Colors.white
              : Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        title: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: size.width * 0.06),
          child: Text(
            currentIndex == 0
                ? ''
                : currentIndex == 1
                    ? ''
                    : currentIndex == 2
                        ? 'Cart'
                        : 'Profile',
            style: appBarText.copyWith(
              color: currentIndex == 2
                  ? Colors.white
                  : Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
            ),
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(
            vertical: size.width * .05, horizontal: size.width * 0.08),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          // padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () => changeNavbar(index),
            splashColor: Colors.transparent,
            highlightColor: Colors.white,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? size.width * .18
                      : size.width * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? size.width * .12 : 0,
                    width: index == currentIndex ? size.width * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.white
                          : Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? size.width * .18
                      : size.width * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? size.width * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex ? listOfStrings[index] : '',
                              style: const TextStyle(
                                color: Colors.transparent,
                                fontWeight: FontWeight.w600,
                                fontSize: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? 20 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: size.width * .076,
                            color: index == currentIndex
                                ? Colors.black
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.search,
    Icons.shopping_cart_outlined,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'h',
    'S',
    'C',
    'P',
  ];
}
