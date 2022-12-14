import 'package:base_structure/app/screens/base/base_state_less.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../views/common_images.dart';


class SplashScreen extends BaseStateLess {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: backgroundColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: kFlexibleSize(60)),
                      height: kFlexibleSize(450),
                      width: double.infinity,
                      child: loclImage,
                    ),
                    Container(
                        width: double.infinity,
                        child: loclTextImage),
                    Container(width: double.infinity, child: appBottomImage,alignment: Alignment.bottomCenter),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
