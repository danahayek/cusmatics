import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/Colors.dart';
import '../../../../core/constant/Strings.dart';
import '../../../../core/custom/appbar/CustomAppBar.dart';
import '../../../../core/featuers/CategoryProducts/ProductProvider.dart';
import '../../../../core/featuers/CategoryProducts/ProductUi.dart';
import '../../../../core/model/CategoryTypes.dart';
import 'DetailScreen3.dart';
class DetailScreen2 extends StatefulWidget {
  final int itemIndex;
  DetailScreen2({required this.itemIndex});

  @override
  State<DetailScreen2> createState() => _DetailScreen2State();
}

class _DetailScreen2State extends State<DetailScreen2> {
  late ProductProvider  productProvider = Provider.of<ProductProvider>(context, listen: false) ;


  final List<CategoryTypes2> category_types=[
    CategoryTypes2(AppText.homefurniture),
    CategoryTypes2(AppText.office),
    CategoryTypes2(AppText.garden),
    CategoryTypes2(AppText.accessories),
    CategoryTypes2(AppText.decoration),

  ];
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        appBar: CustomAppBar(AppText.furnitureCat),
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

                    GestureDetector(onTap: (){
                      Future.delayed(Duration(seconds: 2));
                      productProvider.refreshList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryProduct(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            item.title2, // Replace with your title
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          )
                      ),
                      leading: Icon(Icons.arrow_back_outlined,size: 30,),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      dense: true,
                    ),),

                  ],
                );
              },
            ),
          ),
        ),
      );
  }
}
