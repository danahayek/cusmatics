/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/model/category.dart';

import '../../constant/Colors.dart';

class CustomCategoryGrid3 extends StatefulWidget {
  CategoryModel _categoryModel;


  CustomCategoryGrid3(this._categoryModel);
  @override
  State<CustomCategoryGrid3> createState() => _CustomCategoryGrid3State();
}

class _CustomCategoryGrid3State extends State<CustomCategoryGrid3> {
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
                    _categoryModel.image, // Replace with your image paths
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(height: 20),
                  Text(
                    _categoryModel.title,
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
*/
