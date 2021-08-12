import 'package:flutter/material.dart';
import 'package:flutter_cozy/theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  BottomNavbarItem({this.imageUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            imageUrl,
            width: 26,
          ),
          Spacer(),
          isActive
              ? Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(1000))),
                )
              : Container()
        ],
      ),
    );
  }
}
