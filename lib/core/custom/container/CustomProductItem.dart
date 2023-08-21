
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/custom/text/boldText.dart';
import 'package:untitled/core/featuers/CategoryProducts/ProductProvider.dart';

import '../../constant/Colors.dart';
import '../../model/category.dart';
class CustomProductItem extends StatefulWidget{


  final CategoryModel product;
  double height;
  double width;
  CustomProductItem(this.product,this.width,this.height);

  @override
  State<CustomProductItem> createState() => _CustomProductItemState();
}

class _CustomProductItemState extends State<CustomProductItem> {
  late ProductProvider productProvider;


  int selectedValue = 1;
  String title = '';
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    fetchApiData();
  }

  Future<void> fetchApiData() async {
    Dio dio = Dio();

    try {
      Response response = await dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;

        setState(() {
          products = List<Map<String, dynamic>>.from(responseData);
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index){
          final product = productProvider.items[index];

          return   Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Row(children: [
                          Column(
                            children: [
                              Positioned(
                                top: 50,
                                left: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.yellow,
                                    ),
                                    child: Center(child: SvgPicture.asset(ImagesPath.vector)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Positioned(
                                top: 50,
                                left: 50,
                                child:Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.lightPink,
                                    ),

                                    child: const Center(child: Text(product['rating'] ,
                                        textAlign: TextAlign.center,style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.normal,)),
                                    ),
                                  ),
                                ),
                              ),
                            ],),
                          const SizedBox(width: 5,),
                          Image.asset(widget.product['image'],width: 75,height: 75,),
                        ],),
                      ]),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CustomText(text:widget.product['title'], fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.product.oldPrice as String,
                          style: const TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.lightGray,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(ImagesPath.shekel, width: 15,height: 10,),
                        const SizedBox(width: 3),
                        Text(
                          widget.product['price'] as String,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: AppColors.pink),
                        ),
                      ],),
                  ),
                  Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        widget.product.city,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white
                        ),),
                    ),
                  )
                ],)
          );

    });
  }
}
