import 'dart:io';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final iconList = <IconData>[
      IconlyLight.home,
      IconlyLight.discount,
      Icons.credit_card,
      IconlyLight.profile,
    ];
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator());
      }
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            IconlyBold.scan,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff2DBC77),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: 2,
          backgroundColor: Colors.white,
          activeColor: Color(0xff2DBC77),
          inactiveColor: Colors.black,
          onTap: (int) {},
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,

        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Card',
            style: GoogleFonts.dmSans(color: Colors.black),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 30),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 30),
                child: CircleAvatar(
                    backgroundColor: Color(0xff2DBD77),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_outlined,
                          color: Colors.white,
                        ))))
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 1, right: 1),
                  child: Center(
                    child: Card(
                      child: Container(
                        child: Stack(
                          children: [
                            Image.asset('assets/images/card2.png'),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Text(
                                'Regular Card',
                                style: GoogleFonts.dmSans(color: Colors.white),
                              ),
                            ),
                            Positioned(
                                left: 50,
                                right: 10,
                                bottom: 90,
                                child: Text(
                                  '1203 1204 2304 1234 1232',
                                  style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Text(
                                'Softcent',
                                style: GoogleFonts.dmSans(color: Colors.white),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Text(
                                'Payback',
                                style: GoogleFonts.dmSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff3aa672),
                              Color(0xff3fffa2),
                            ],
                          ),
                        ),
                        //declare your widget here
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 51),
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Recent Transaction',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 17,
              ),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.transactionDataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 94,
                        child: Card(
                          elevation: 0,
                          margin: EdgeInsets.all(2),
                          semanticContainer: true,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                  Image.network(
                                    controller.transactionDataList[index].shopLogo
                                        .toString(),
                                    height: 40,
                                    width: 40,
                                  ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller
                                        .transactionDataList[index].shopName),
                                    Text(
                                        'Trans ID: ' +
                                            controller
                                                .transactionDataList[index]
                                                .transactionId,
                                        style: GoogleFonts.dmSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54)),
                                    Row(
                                      children: [
                                        Image.asset('assets/images/dp.png'),
                                        Text(
                                          ' ' +
                                              controller
                                                  .transactionDataList[index]
                                                  .paymentType,
                                          style: GoogleFonts.dmSans(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(controller
                                        .transactionDataList[index].timestamp, style: GoogleFonts.dmSans(color: Colors.black54, fontSize: 10),),
                                    Text(
                                      '-৳' +
                                          controller.transactionDataList[index]
                                              .amountSend
                                              .toString(),
                                      style: GoogleFonts.dmSans(color: Colors.red, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '+৳' +
                                          controller.transactionDataList[index]
                                              .amountRecieved
                                              .toString(),
                                      style: GoogleFonts.dmSans(color: Colors.green, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
