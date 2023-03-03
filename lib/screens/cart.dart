import 'package:blopz/constants/customcolors.dart';
import 'package:blopz/constants/customtext.dart';
import 'package:blopz/constants/spacing.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: blueGradient,
            ),
            child: Column(
              children: [
                minVetSpacing,
                Container(
                  height: size.height * .6,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          leading: Container(
                            width: size.width * .14,
                            // padding: EdgeInsets.symmetric(
                            //     vertical: 25, horizontal: 10),
                            color: Colors.grey[400],
                            child: Center(
                                child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            )),
                          ),
                          title: Text(
                            cartItemsList[index]['title'],
                            style: boldregularText.copyWith(fontSize: 20),
                          ),
                          subtitle: Text(
                            cartItemsList[index]['amount'],
                            style: boldregularText.copyWith(
                                fontSize: 18, color: Colors.grey[400]),
                          ),
                          trailing: Icon(Icons.close),
                        ),
                      );
                    },
                    itemCount: cartItemsList.length,
                  ),
                ),
                Container(
                  width: size.width * .9,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total:',
                            style: boldregularText.copyWith(
                                fontSize: 30,
                                color: Color.fromRGBO(156, 193, 222, 1)),
                          ),
                          Row(
                            children: [
                              Text(
                                '\$ 4000',
                                style: boldregularText.copyWith(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '.00',
                                style: boldregularText.copyWith(
                                    fontSize: 30, color: fadedBlue),
                              ),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: size.width * .3,
                          height: size.height * .07,
                          decoration: BoxDecoration(
                              color: logoOrange,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            'Checkout',
                            style:
                                boldregularText.copyWith(color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  List cartItemsList = [
    {
      'title': 'Lorem Ipsum dolor sit',
      'amount': '\$1000.00',
    },
    {
      'title': 'Lorem Ipsum dolor sit',
      'amount': '\$1000.00',
    },
    {
      'title': 'Lorem Ipsum dolor sit',
      'amount': '\$1000.00',
    },
    {
      'title': 'Lorem Ipsum dolor sit',
      'amount': '\$1000.00',
    },
  ];
}
