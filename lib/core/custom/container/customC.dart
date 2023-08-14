import 'package:flutter/material.dart';
import 'package:untitled/core/constant/Colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget? prefixIcon;
  double? width;
  double? height;
  final Color? backgroundColor;


  CustomContainer(this.prefixIcon,this.backgroundColor,this.width,this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: prefixIcon,
      height: height,
      width: width,
      decoration:  BoxDecoration(
        color: backgroundColor, // Change the color as needed
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      ),


    );
  }
}
