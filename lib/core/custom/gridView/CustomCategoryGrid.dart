import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant/Colors.dart';
import '../../model/category.dart';
import '../../model/product.dart';

class CustomCategoryGrid extends StatelessWidget {
    Product pro;

   CustomCategoryGrid(this.pro);

  @override
  Widget build(BuildContext context) {
    return
      GridTile(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(

            decoration: BoxDecoration(
              color:AppColors.pink,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    pro.image, // Replace with your image paths
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(height: 20),
                  Text(
                    pro.title,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
