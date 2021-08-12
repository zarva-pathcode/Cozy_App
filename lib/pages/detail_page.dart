import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:flutter_cozy/pages/error_page.dart';

import 'package:flutter_cozy/widgets/facility_item.dart';
import 'package:flutter_cozy/widgets/rating_item.dart';
import "package:url_launcher/url_launcher.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 360.w,
              fit: BoxFit.cover,
            ),
            ListView(
              shrinkWrap: false,
              children: [
                SizedBox(
                  height: 328.w,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.w),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.w,
                      ),
                      //NOTE: Heading&Title
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  textScaleFactor: 1.0,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style: purpleTextStyle.copyWith(
                                        fontSize: 16.sp),
                                    children: [
                                      TextSpan(
                                          text: " / month",
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16.sp)),
                                    ],
                                  ),
                                  textScaleFactor: 1.0,
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2.w),
                                  child: RatingItem(
                                    index: index,
                                    rating: space.rating,
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.w,
                      ),
                      //NOTE: Main Facilities
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          "Main Facilities",
                          textScaleFactor: 1.0,
                          style: blackTextStyle.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              imageUrl: "assets/icons/bar-counter.png",
                              name: "Kitchen",
                              total: space.numberOfKitchens,
                            ),
                            FacilityItem(
                              imageUrl: "assets/icons/bar-cupboard.png",
                              name: "Big Ice Cube",
                              total: space.numberOfCupboards,
                            ),
                            FacilityItem(
                              imageUrl: "assets/icons/double-bed.png",
                              name: "Bedroom",
                              total: space.numberOfBedrooms,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.w,
                      ),
                      //NOTE: Photos
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          "Photos",
                          textScaleFactor: 1.0,
                          style: blackTextStyle.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 8,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(left: edge),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.w),
                                  child: Image.network(
                                    item,
                                    width: 100.h,
                                    height: 88.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()),
                      ),
                      SizedBox(
                        height: 30.w,
                      ),

                      //NOTE: Location
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          "Location",
                          textScaleFactor: 1.0,
                          style: blackTextStyle.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 7.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${space.address}\n${space.city}",
                              textScaleFactor: 1.0,
                              style: greyTextStyle.copyWith(fontSize: 14.sp),
                            ),
                            InkWell(
                              onTap: () {
                                // launchUrl(
                                //     "https://goo.gl/maps/SyZx2yjWB1yR6AeH8");
                                launchUrl(space.mapUrl);
                              },
                              child: Image.asset(
                                "assets/icons/btn_location.png",
                                width: 40.w,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.w,
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl("tel:${space.phone}");
                          },
                          style: ButtonStyle(
                              shadowColor:
                                  MaterialStateProperty.all(purpleColor),
                              backgroundColor:
                                  MaterialStateProperty.all(purpleColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.w)))),
                          child: Text(
                            "Book Now",
                            textScaleFactor: 1.0,
                            style: whiteTextStyle.copyWith(fontSize: 18.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.w,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons/btn_back.png",
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    "assets/icons/btn_wishlist.png",
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
