import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:flutter_cozy/pages/detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cozy/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(space)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.w),
            child: Container(
              width: 110.h,
              height: 90.h,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl,
                    height: 90.h,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 60.h,
                      height: 28.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.w)),
                          color: purpleColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/Icon_star_solid.png",
                            width: 18.h,
                            height: 18.h,
                          ),
                          Text(
                            "${space.rating}/5",
                            textScaleFactor: 1.0,
                            style: whiteTextStyle.copyWith(fontSize: 12.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.15,
                child: Text(
                  space.name,
                  textScaleFactor: 1.0,
                  style: blackTextStyle.copyWith(fontSize: 16.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 2.w,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(
                    fontSize: 14.sp,
                  ),
                  children: [
                    TextSpan(
                        text: " / month",
                        style: greyTextStyle.copyWith(fontSize: 14.sp)),
                  ],
                ),
                textScaleFactor: 1.0,
              ),
              SizedBox(
                height: 16.w,
              ),
              Text(
                "${space.city}, ${space.country}",
                textScaleFactor: 1.0,
                style: greyTextStyle.copyWith(fontSize: 12.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}
