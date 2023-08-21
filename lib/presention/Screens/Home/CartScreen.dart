import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/constant/ImagesPath.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/appbar/CustomAppBar.dart';
import '../../../core/custom/button/buttonCustom.dart';
import '../../../core/custom/container/CustomCart.dart';
import '../../../core/custom/text/boldText.dart';
import '../../../core/model/Cart.dart';
class cartScreen extends StatefulWidget{
  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  final List<Cart> cart = [

    Cart(AppText.table3,ImagesPath.table3,AppText.name,"20",AppText.city),
    Cart(AppText.chairK,ImagesPath.chairK,AppText.name,"20",AppText.city),
    Cart(AppText.shoes_table,ImagesPath.shoes_table,AppText.name,"20",AppText.city),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppText.add_to_cart),
      backgroundColor: AppColors.Gray,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column( // Wrap both ListView.builder and Container in a Column
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return CustomCard(item);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 380,
                height: 50,
                color: AppColors.sky,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        SvgPicture.asset(ImagesPath.shekel, width: 10,height: 10, color: AppColors.black,),
                        const SizedBox(width: 5),
                        Text(
                          "75",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 200,),

                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: CustomText( text:AppText.total,fontSize: 18,fontWeight: FontWeight.normal, ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 37,),
              CustomButtonPink(text: AppText.addOrder,onPressed: (){}),
              SizedBox(height: 5,),
              CustomButtonLightpink(text: AppText.cleanCart,onPressed: (){}),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}