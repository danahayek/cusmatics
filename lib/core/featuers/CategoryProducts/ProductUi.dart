import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/custom/appbar/CustomAppBar.dart';
import 'package:untitled/core/custom/container/CustomProductItem.dart';
import 'package:untitled/core/featuers/CategoryProducts/ProductEnum.dart';
import 'package:untitled/core/model/category.dart';
import 'package:untitled/core/model/product.dart';
import 'package:untitled/presention/Screens/bottomNavigationBar/CategoryDetailsPages/DetailScreen4.dart';

import '../../constant/Colors.dart';
import '../../constant/Strings.dart';
import '../../custom/button/CustomSearch.dart';
import '../../custom/button/buttonCustom.dart';
import '../../custom/gridView/RadioButton.dart';
import 'ProductProvider.dart';

class CategoryProduct extends StatefulWidget {
  List<CategoryModel> items =[];
  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  final TextEditingController controller = TextEditingController();
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
    final productList = productProvider.items;

    return Scaffold(
      appBar: CustomAppBar(AppText.homefurniture),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CustomFilterBtn(
                  onPressed: () {
                    return showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return RadioBottomSheetWidget(AppText.order_products);
                      },
                    );
                  },
                  prefixIcon: Icon(Icons.filter_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 270,
                  height: 50,
                  child: CustomSearchBar(controller: controller),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
    final product = productProvider.items[index];

    return
    GestureDetector(onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => DetailScreen4(),
    ),
    );
    },child: CustomProductItem(product,200,320));

     /*       Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Price: \$${product['price'].toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          );*/
        },
      ),
    );
  }
}
