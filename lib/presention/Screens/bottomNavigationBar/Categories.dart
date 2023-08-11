import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/constant/Colors.dart';
import 'package:untitled/core/custom/container/catergoryCustom.dart';

import '../../../core/constant/ImagesPath.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/appbar/CustomAppBar.dart';
import '../../../core/custom/gridView/CustomCategoryGrid.dart';
import '../../../core/model/product.dart';
import 'CategoryDetailsPages/DetailCategory.dart';



class Categories extends StatefulWidget{
  @override
  State<Categories> createState() => _CategoriesState();


}

class _CategoriesState extends State<Categories> {
  final List<Product> grid_items = [
    Product(1,AppText.beauty,ImagesPath.beauty),
    Product(2,AppText.baby,ImagesPath.baby),
    Product(3,AppText.eyes,ImagesPath.eye),


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
          itemCount: grid_items.length ,
          itemBuilder:
              (BuildContext context, int index){
            final gridItems = grid_items[index];
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