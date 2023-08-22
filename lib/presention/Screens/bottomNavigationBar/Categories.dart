import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/constant/Colors.dart';
import 'package:untitled/core/custom/container/catergoryCustom.dart';

import '../../../core/constant/ImagesPath.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/appbar/CustomAppBar.dart';
import '../../../core/custom/gridView/CustomCategoryGrid.dart';
import '../../../core/model/Category.dart';
import 'CategoryDetailsPages/DetailCategory.dart';



class Categories extends StatefulWidget{
  @override
  State<Categories> createState() => _CategoriesState();


}

class _CategoriesState extends State<Categories> {
  final List<ProductCategory> category = [
    ProductCategory(1,AppText.beauty,ImagesPath.beauty),
    ProductCategory(2,AppText.baby,ImagesPath.baby),
    ProductCategory(3,AppText.accessories,ImagesPath.jewelry),
    ProductCategory(4,AppText.nature,ImagesPath.nature),
    ProductCategory(5,AppText.pharmacy,ImagesPath.pharmacy),
    ProductCategory(6,AppText.eyes,ImagesPath.eye),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(AppText.category),
      body: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
          ),
          itemCount: category.length ,
          itemBuilder:
              (BuildContext context, int index){
            final gridItems = category[index];
            return GestureDetector(
              onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCategory(),
                ),
              );},
                child: CustomCategoryGrid(gridItems));
          }



      ),

    );
  }
}