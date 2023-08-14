import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/constant/Colors.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/constant/Strings.dart';
import 'package:untitled/core/custom/appbar/CustomAppBar.dart';
import 'package:untitled/core/custom/button/buttonCustom.dart';
import 'package:untitled/core/custom/text/boldText.dart';

import '../../../../core/custom/container/CustomHomeProductItem.dart';
import '../../../../core/model/category.dart';
class DetailScreen4 extends StatefulWidget {
  const DetailScreen4({Key? key}) : super(key: key);

  @override
  State<DetailScreen4> createState() => _DetailScreen4State();
}

class _DetailScreen4State extends State<DetailScreen4> {
  final List<CategoryModel> c = [
    CategoryModel(ImagesPath.radioC, AppText.radio, '66', '56', AppText.city),
    CategoryModel(ImagesPath.babiesC, AppText.babies, '66', '56', AppText.city),
    CategoryModel(ImagesPath.chairsC, AppText.radio, '66', '56', AppText.city),
  ];
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar:CustomAppBar2(AppText.homefurniture) ,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 230,
                  width: double.infinity,
                  color: AppColors.white,
                  child: Image.asset(ImagesPath.table3),),
                SizedBox(height: 10,),
                Row(children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,color: AppColors.pink,size: 30,)),
                  SizedBox(width: 120,),
                  CustomText(text: AppText.table3,fontWeight: FontWeight.bold,fontSize: 25,),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightPink),
                      shape: BoxShape.rectangle,
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Center(
                      child: Text(
                        AppText.newbtn,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightPink
                        ),),
                    ),
                  ),
                  SizedBox(width: 180,),
                  Text(
                    '295',
                    style: const TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.lightGray,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(ImagesPath.shekel, width: 20,height: 10,),
                  const SizedBox(width: 10),
                  Text(
                    '280',
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: AppColors.pink),
                  ),

                ],),
                Row(children:
                [SizedBox(width: 210,),
                  Image.asset(ImagesPath.logoCat_png),
                  SizedBox(width: 15,),
                Text(AppText.logo_titleC,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.black),)],),
                Row(children: [
                  SizedBox(width: 200,),
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightPink),
                      shape: BoxShape.rectangle,
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: const Center(
                      child: Text(
                        'منتج مباع',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white
                        ),),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightPink),
                      shape: BoxShape.rectangle,
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Center(
                      child: Text(
                        'منتج متاح',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white
                        ),),
                    ),
                  ),
                ],),
                SizedBox(height: 30,),
                CustomButtonPink(text: AppText.add_to_cart, onPressed: () {  },),
                SizedBox(height: 10,),
                CustomButtonLightpink(text: AppText.contact_whatsapp,),
                CustomText(text: AppText.product_details,fontWeight: FontWeight.bold,color: AppColors.black,textAlign: TextAlign.end,fontSize: 16,),
                SizedBox(height: 10,),
                CustomText(text: AppText.product_details_pargh,color: AppColors.Gray,fontSize: 15.5,textAlign: TextAlign.right,),
                TextButton(onPressed: (){}, child: CustomText(text: AppText.read_more,color: AppColors.pink,textAlign: TextAlign.right,)),
                SizedBox(height: 10,),

                CustomHomeProductItem(items: c, title: AppText.similar_product,),


              ],
            ),
          ),

        );
  }
}
