import 'package:flutter/material.dart';
import 'package:untitled/core/constant/Colors.dart';
import 'package:untitled/core/constant/Strings.dart';
import 'package:untitled/core/custom/appbar/CustomAppBar.dart';
import 'package:untitled/core/model/CategoryTypes.dart';

import 'DetailScreen2.dart';
class DetailCategory extends StatefulWidget {
  const DetailCategory({Key? key}) : super(key: key);

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {

  final List<CategoryTypes> category_types=[
    CategoryTypes(AppText.clothsCat),
    CategoryTypes(AppText.furnitureCat),
    CategoryTypes(AppText.electronicCat),
    CategoryTypes(AppText.babeisCat),
    CategoryTypes(AppText.carsCat),
    CategoryTypes(AppText.apartmentsCat),
    CategoryTypes(AppText.sellersCat),
    CategoryTypes(AppText.donationsCat),


  ];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: CustomAppBar(AppText.category),
        backgroundColor: AppColors.white,
        body:
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightGray.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(height: 20,thickness: 8,color: AppColors.lightGray,),
              itemCount: category_types.length, // Number of list items
              itemBuilder: (BuildContext context, int index) {
                final item = category_types[index];

                return Column(
                  children: [

                //    GestureDetector(onTap: (){
                //       Navigator.push(
                //        context,
                //       MaterialPageRoute(
                //      builder: (context) => DetailScreen2(itemIndex:index),
                //   ),
                // );
               //     },),
                    GestureDetector(
    onTap: (){
          Navigator.push(
           context,
          MaterialPageRoute(
         builder: (context) => DetailScreen2(itemIndex:index),
      ),
    );
        },
                      child: ListTile(
                        title: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            item.title, // Replace with your title
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          )
                        ),
                        leading: Icon(Icons.arrow_back_outlined,size: 30,),
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        dense: true,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
  }
}
