import 'package:flutter/material.dart';
import 'package:untitled/core/custom/appbar/CustomAppBar.dart';
import 'package:untitled/core/custom/button/CustomSearch.dart';
import 'package:untitled/core/custom/container/customC.dart';

import '../../../../core/constant/Colors.dart';
import '../../../../core/constant/ImagesPath.dart';
import '../../../../core/constant/Strings.dart';
import '../../../../core/custom/container/CustomProductItem.dart';
import '../../../../core/custom/gridView/CustomCategoryGrid.dart';
import '../../../../core/model/category.dart';
class DetailScreen3 extends StatefulWidget {
  final int itemIndex;
  DetailScreen3({required this.itemIndex});

  @override
  State<DetailScreen3> createState() => _DetailScreen3State();
}

class _DetailScreen3State extends State<DetailScreen3> {
  final TextEditingController controller = TextEditingController();

  final List<CategoryModel> _grid_items = [
    CategoryModel(ImagesPath.radioC, AppText.radio, '66', '56', AppText.city),
    CategoryModel(ImagesPath.babiesC, AppText.babies, '66', '56', AppText.city),
    CategoryModel(ImagesPath.chairsC, AppText.radio, '66', '56', AppText.city),


  ];

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: CustomAppBar(AppText.homefurniture),
          backgroundColor: AppColors.white,
          body:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSearchBar(controller: controller,),
                    SizedBox(width: 15,),
                    CustomContainer(Icon(Icons.filter_alt_outlined),AppColors.lightPink)
                  ],
                ),
              ),
              GridView.builder
                (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
              ),
                  itemCount: _grid_items.length,
                  itemBuilder:   (BuildContext context, int index){
                    final gridItems2 = _grid_items[index];
                    return GestureDetector(
                        onTap: (){
                         },
                        child: CustomProductItem(gridItems2));
                  },)
            ],
          ),

          
        );
  }
}
