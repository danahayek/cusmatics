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

      await Future.delayed(Duration(seconds: 3));
      final List<CategoryModel> _items = [
        CategoryModel(ImagesPath.table3, AppText.table3, '55', '56', AppText.city),
        CategoryModel(ImagesPath.coffee_table, AppText.coffee_table, '55', '56', AppText.city),
        CategoryModel(ImagesPath.sofa, AppText.sofa, '55', '56', AppText.city),
        CategoryModel(ImagesPath.shoes_table, AppText.shoes_table, '55', '56', AppText.city),
        CategoryModel(ImagesPath.chairK, AppText.chairK, '55', '56', AppText.city),
        CategoryModel(ImagesPath.sofa, AppText.sofa, '55', '56', AppText.city),
      ];
      items.addAll(_items);

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