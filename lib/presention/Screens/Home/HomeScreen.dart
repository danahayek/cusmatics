import 'package:flutter/material.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/custom/text/boldText.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/CustomSearch.dart';
import '../../../core/custom/container/CustomHomeProductItem.dart';
import '../../../core/custom/container/catergoryCustom.dart';
import '../../../core/custom/container/customC.dart';
import '../../../core/model/category.dart';
import '../../../core/model/category.dart';
import '../../../core/model/product.dart';
import '../bottomNavigationBar/BottomNavBar.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  final List<Product> category = [
    Product(1,AppText.beauty,ImagesPath.beauty),
    Product(2,AppText.baby,ImagesPath.baby),
    Product(3,AppText.jewelry,ImagesPath.jewelry),
    Product(4,AppText.nature,ImagesPath.nature),
    Product(5,AppText.pharmacy,ImagesPath.pharmacy),
    Product(6,AppText.eyes,ImagesPath.eye),
  ];

  final List<CategoryModel> c = [
    CategoryModel(ImagesPath.radioC, AppText.radio, '66', '56', AppText.city),
    CategoryModel(ImagesPath.babiesC, AppText.babies, '66', '56', AppText.city),
    CategoryModel(ImagesPath.chairsC, AppText.radio, '66', '56', AppText.city),
  ];
  late final CategoryModel _category;

  // List<String> search= [];
  // void _runFilter(String enteredKeyword) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     results = search;
  //   } else {
  //     results = search
  //         .where((user) =>
  //         user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }
  //
  // }
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