
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/custom/appbar/CustomAppBar.dart';
import 'package:untitled/core/custom/button/CustomSearch.dart';
import 'package:untitled/core/custom/container/customC.dart';

import '../../../../core/constant/Colors.dart';
import '../../../../core/constant/ImagesPath.dart';
import '../../../../core/constant/Strings.dart';
import '../../../../core/custom/button/buttonCustom.dart';
import '../../../../core/custom/container/CustomProductItem.dart';
import '../../../../core/custom/gridView/CustomCategoryGrid.dart';
import '../../../../core/custom/gridView/RadioButton.dart';
import '../../../../core/model/category.dart';
import 'DetailScreen4.dart';

class DetailScreen3 extends StatefulWidget {
  final int itemIndex;

  DetailScreen3({required this.itemIndex});

  @override
  State<DetailScreen3> createState() => _DetailScreen3State();
}

class _DetailScreen3State extends State<DetailScreen3> {
  final TextEditingController controller = TextEditingController();

  final List<CategoryModel> items = [
    CategoryModel(ImagesPath.table3, AppText.table3, '55', '56', AppText.city),
    CategoryModel(ImagesPath.coffee_table, AppText.coffee_table, '55', '56', AppText.city),
    CategoryModel(ImagesPath.sofa, AppText.sofa, '55', '56', AppText.city),
    CategoryModel(ImagesPath.shoes_table, AppText.shoes_table, '55', '56', AppText.city),
    CategoryModel(ImagesPath.chairK, AppText.chairK, '55', '56', AppText.city),
    CategoryModel(ImagesPath.sofa, AppText.sofa, '55', '56', AppText.city),
  ];

  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(AppText.homefurniture),
        backgroundColor: AppColors.white,
        body :  Column(
          children: [
            Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        CustomFilterBtn(
                          onPressed: (){
                           return showModalBottomSheet(
                             context: context,
                           builder: (BuildContext context) {
                               return   RadioBottomSheetWidget(AppText.order_products);
                           });
                          }, prefixIcon: Icon(Icons.filter_alt_outlined),

                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            width: 285,
                            height: 62,
                            child: CustomSearchBar(controller: controller)),
                      ],
                    ),
                  ),
           SizedBox(height: 20,),
            Expanded(
              child: GridView.builder
                (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // Number of columns in the grid
                mainAxisSpacing: 15.0, // Spacing between rows
                crossAxisSpacing: 15.0, // Spacing between columns
              ),
                  itemCount: items.length,

                itemBuilder: (BuildContext context, int index) {
                    return
                      GestureDetector(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen4(),
                          ),
                        );
                      },child: CustomProductItem(items[index],220,233));
                  },),
            )
          ],
        ),
        );
  }
}
