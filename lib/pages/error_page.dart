import 'package:flutter/material.dart';
import 'package:flutter_cozy/pages/home_page.dart';
import 'package:flutter_cozy/theme.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/404.png",
                width: 300,
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Where are you going?",
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Seems like the page that you were\nrequested is already gone",
                style: greyTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 210,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: purpleColor,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  },
                  child: Text(
                    "Back Home",
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
