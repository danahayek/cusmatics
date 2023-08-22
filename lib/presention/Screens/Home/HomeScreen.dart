import 'package:flutter/material.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/custom/text/boldText.dart';
import 'package:untitled/core/model/Product.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/CustomSearch.dart';
import '../../../core/custom/container/CustomHomeProductItem.dart';
import '../../../core/custom/container/catergoryCustom.dart';
import '../../../core/custom/container/customC.dart';
import '../../../core/model/Category.dart';
import '../../../core/model/ProductItems.dart';
import '../bottomNavigationBar/BottomNavBar.dart';
import 'favorite.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  final List<ProductCategory> category = [
    ProductCategory(1,AppText.beauty,ImagesPath.beauty),
    ProductCategory(2,AppText.baby,ImagesPath.baby),
    ProductCategory(3,AppText.jewelry,ImagesPath.jewelry),
    ProductCategory(4,AppText.nature,ImagesPath.nature),
    ProductCategory(5,AppText.pharmacy,ImagesPath.pharmacy),
    ProductCategory(6,AppText.eyes,ImagesPath.eye),
  ];

  final List<ProductItems> c = [
    ProductItems(ImagesPath.radioC, AppText.radio, '66', '56', AppText.city),
    ProductItems(ImagesPath.babiesC, AppText.babies, '66', '56', AppText.city),
    ProductItems(ImagesPath.chairsC, AppText.radio, '66', '56', AppText.city),
  ];
  late final ProductItems _category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    CustomContainer(Icon(Icons.notifications_active, color: AppColors.black, size: 30,),AppColors.lightGray,50,50),
                    const SizedBox(width: 8,),
                    CustomContainer(Icon(Icons.favorite_border, color: AppColors.black, size: 30,),AppColors.lightGray,50,50),
                    const SizedBox(width: 8,),
                    CustomContainer(Icon(Icons.notifications_none, color: AppColors.black, size: 30,),AppColors.lightGray,50,50),
                    const SizedBox(width: 100,),
                    Image.asset(ImagesPath.splashImage, width: 75, height: 75,),
                  ],
                ),
              ), //bar
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: CustomSearchBar(controller: controller),
              ), //search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20
                ),
                child: CustomText(text: AppText.category, fontWeight: FontWeight.bold, fontSize: 20,),
              ),

              SizedBox(
                height: 140,

                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListView.builder(
                    itemBuilder:(context, index) {
                      final item = category[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Row(children: [
                            CustomCategoryContainer(item)
                          ]),
                        ),
                      );
                    },
                    itemCount: category.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ), //category
              CustomHomeProductItem(items: c, title: AppText.recently_added,),
              CustomHomeProductItem(items: c, title: AppText.babies,),
              CustomHomeProductItem(items: c, title: AppText.babies,),







            ]),
      ),
    );
  }
}