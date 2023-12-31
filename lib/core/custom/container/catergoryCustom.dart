import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/Colors.dart';
import '../../model/Category.dart';
class CustomCategoryContainer extends StatelessWidget{


  final ProductCategory category;

  CustomCategoryContainer(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 95,
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      child: Center(
        child: Column(children: [
          SizedBox(height: 10,),
          SvgPicture.asset(category.image as String, width: 40, height: 40, color: AppColors.white,),
          SizedBox(height: 7,),
          Text(category.title, style: TextStyle(color: AppColors.white, fontSize: 16),),

        ],),
      ),

    );
  }

}
