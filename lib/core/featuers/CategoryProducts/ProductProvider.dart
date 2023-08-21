import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/featuers/CategoryProducts/ProductEnum.dart';

import '../../constant/ImagesPath.dart';
import '../../constant/Strings.dart';
import '../../model/category.dart';
import '../../model/product.dart';

class ProductProvider extends ChangeNotifier{
  bool _isLoading = false;

  List<CategoryModel> items = [];

  PageState errorType=PageState.dataLoading;
  String getErrorMessage(PageState errorType) {
    switch (errorType) {
      case PageState.showData:
        return "Data found";

      case PageState.dataNotFound:
        return "Data not found";

      case PageState.dataLoading:
        return "Data Loading";

      case PageState.pageError:
        return "page error";

      case PageState.networkProblem:
        return "Network problem";

      default:
        return "An error occurred";
    }
  }

  // fetch reload
  Future<void> reloadData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate loading for 2 seconds

    items.shuffle();
    notifyListeners();
  }
  Future<void> refreshList() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2)); // Simulate loading for 2 seconds

    items.shuffle();
    _isLoading = false;
    notifyListeners();
  }
  //get data
  Future<void> getDate() async {
    try{
      Dio dio = Dio();
        Response response = await dio.get('https://fakestoreapi.com/products');

        if (response.statusCode == 200) {
        List<CategoryModel>  _items  = items =response.data.map((x) => CategoryModel.fromJson(x)).toList();
        items.addAll(_items);

          if(items.isEmpty){
            errorType=PageState.dataNotFound;
          }else{
            errorType=PageState.showData;
          }

        }



      if(items.isEmpty){
        errorType=PageState.dataNotFound;
      }else{
        errorType=PageState.showData;
      }
    }catch(e){
      errorType=PageState.pageError;

    }
    notifyListeners();
    print("errorType $errorType");
  }

}