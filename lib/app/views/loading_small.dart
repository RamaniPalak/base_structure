import 'package:base_structure/app/utils/constants.dart';
import 'package:flutter/material.dart';

class LoadingSmall extends StatelessWidget {

  LoadingSmall({this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1,
      child: Container(
        height: size ?? 22,
        width: size ?? 22,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? kPrimaryColor),
        ),
      ),
    );
  }
}