import 'package:flutter/material.dart';
import 'package:untitled/core/constant/Colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget? prefixIcon;
  double? width;
  double? height;

  CustomContainer(this.prefixIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: prefixIcon,
      height: 60,
      width: 60,
      decoration:  BoxDecoration(
        color: AppColors.lightGray, // Change the color as needed
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      ),


    );
  }
}
