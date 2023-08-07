import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/constant/Colors.dart';
import 'package:untitled/core/constant/ImagesPath.dart';

import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/CustomSearch.dart';
import '../../../core/custom/container/HomeContainerCustom.dart';
import '../../../core/custom/container/catergoryCustom.dart';
import '../../../core/custom/container/customC.dart';
import '../../../core/custom/text/boldText.dart';
import '../../../core/model/product.dart';

class HomeC extends StatefulWidget {
  const HomeC({Key? key}) : super(key: key);

  @override
  State<HomeC> createState() => _HomeCState();
}

class _HomeCState extends State<HomeC> {

  String _searchText = '';
  final TextEditingController search = TextEditingController();
  final List<Product> items = [
    Product(1,AppText.beauty,ImagesPath.beauty),
    Product(2,AppText.baby,ImagesPath.baby),
    Product(3,AppText.jewelry,ImagesPath.jewelry),
    Product(4,AppText.nature,ImagesPath.nature),
    Product(5,AppText.pharmacy,ImagesPath.pharmacy),
    Product(6,AppText.eyes,ImagesPath.eye),

    // Add more items as needed
  ];
  late final Product _product;

  List<String> searchItems = ['تجميل','أطفال','اكسسوارات','طبيعة','صيدلية','بصريات'];
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
                     CustomContainer(Icon(
                      Icons.notifications_active,
                      color: AppColors.black,
                      size: 30,
                    )),
                     SizedBox(
                      width: 8,
                    ),
                     CustomContainer(Icon(
                      Icons.favorite_border,
                      color: AppColors.black,
                      size: 30,
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                     CustomContainer(Icon(
                      Icons.notifications_none,
                      color: AppColors.black,
                      size: 30,
                    )),
                    const SizedBox(
                      width: 110,
                    ),
                    Image.asset(
                      ImagesPath.splashImage,
                      width: 70,
                      height: 70,
                    ),
                  ],
                ),
              ), //bar
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: CustomSearchBar(
                  controller: search,
                ),
              ),
              SizedBox(height:10),//search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20
                ),
                child: CustomText(
                  text: AppText.category,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  itemBuilder:(context, index) {
                    final item = items[index];
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
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height:10), //search
              //container text in rows
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15
                ),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  child: Row(
                    children: [
                      CustomText(
                      text: AppText.more,
                      fontWeight: FontWeight.bold,
                      color: AppColors.pink,
                      fontSize: 18,
                    ),
                      SizedBox(width: 200,),
                      CustomText(
                        text: AppText.recently_added,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ],
                  ),
                ),

              ),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(children: [
                          HomeCustom(),
                          const SizedBox(
                            width: 10,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              //category


            ]),
      ),
    );
  }


}
