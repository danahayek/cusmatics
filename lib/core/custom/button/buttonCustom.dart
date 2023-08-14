import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/constant/Colors.dart';

class CustomButtonPink extends StatelessWidget {

  final String text;
  final Function()? onPressed;

  CustomButtonPink({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(primary:Color(0xFFD52A70) ,
        padding: EdgeInsets.symmetric(horizontal: 145, vertical: 12),),
      child: Text(text,style: TextStyle(color:Colors.white ,fontSize: 14 ),),
    );
  }
}

class CustomButtonLightpink extends StatelessWidget {

  final String text;
  final Function()? onPressed;

  CustomButtonLightpink({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary: Color(0xFFF59AA9),
          padding: EdgeInsets.symmetric(horizontal: 145, vertical: 12),),
        child: Text(text,
            style: TextStyle(color: Colors.white, fontSize: 14)));
  }
}
class CustomFilterBtn extends StatelessWidget {

  final Widget prefixIcon;
  final Function()? onPressed;

  CustomFilterBtn({required this.prefixIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:  BoxDecoration(
          color: AppColors.lightPink, // Change the color as needed
          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        ),
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: Center(
          child: IconButton(
            color: AppColors.white,
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(primary: Color(0xFFF59AA9),
                padding: EdgeInsets.symmetric(horizontal: 145, vertical: 12),),
              icon: prefixIcon,

          ),
        ),
      ),
    );
  }
}