import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  final TextAlign? textAlign;


  CustomText({required this.text,this.fontWeight,this.color,this.fontSize,this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Text(

      text,textAlign:textAlign,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color),);
  }
}

Widget CustomTextBolodRed12(String text){
  return CustomText(text: text,fontSize: 12,fontWeight: FontWeight.bold,color: Colors.red,);
}

class titleText extends StatelessWidget {
  final String title;

  const titleText({required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title,textAlign:TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey),);
  }
}

