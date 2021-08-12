import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/city.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:flutter_cozy/models/tips.dart';
import 'package:flutter_cozy/provider/space_provider.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/widgets/bottom_navbar_items.dart';
import 'package:flutter_cozy/widgets/city_card.dart';
import 'package:flutter_cozy/widgets/space_card.dart';
import 'package:flutter_cozy/widgets/tips_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecommendedSpace();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 20.w,
            ),
            //NOTE:Header&Title
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Explore Now",
                textScaleFactor: 1.0,
                style: blackTextStyle.copyWith(
                    fontSize: 22.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Mencari kosan yang cozy",
                textScaleFactor: 1.0,
                style: greyTextStyle.copyWith(
                    fontSize: 14.sp, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 28.w,
            ),
            //NOTE: Popular Cities
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Popular Cities",
                textScaleFactor: 1.0,
                style: blackTextStyle.copyWith(
                    fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16.w,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 22.h,
                  ),
                  CityCard(City(
                      id: 1,
                      name: "Jakarta",
                      imageUrl: "assets/images/city2.png")),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 2,
                      name: "Bandung",
                      imageUrl: "assets/images/city1.png",
                      isPopular: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 3,
                        name: "Surabaya",
                        imageUrl: "assets/images/city3.png"),
                  ),
                  SizedBox(
                    width: 20.h,
                  )
                ],
              ),
            ),
            SizedBox(height: 30.w),
            //NOTE: Recomended Space
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Recomended Space",
                textScaleFactor: 1.0,
                style: blackTextStyle.copyWith(
                    fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpace(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;
                      int index = 0;

                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(
              height: 30.w,
            ),
            //NOTE: Tips&Guidance
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Tips & Guidance",
                textScaleFactor: 1.0,
                style: blackTextStyle.copyWith(
                    fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                        id: 1,
                        headline: "City Guidliness",
                        image: "assets/icons/tips1.png",
                        updatedAt: "Updated 23 apr"),
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                  TipsCard(
                    Tips(
                        id: 2,
                        headline: "Java Fairship",
                        image: "assets/icons/tips2.png",
                        updatedAt: "Updated 3 may"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75.w + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(23.w), color: Color(0xffF6F7F8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavbarItem(
              imageUrl: "assets/icons/Icon_home_solid.png",
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: "assets/icons/mail.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/icons/card.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/icons/Union.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
