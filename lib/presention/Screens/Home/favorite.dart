import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/constant/ImagesPath.dart';

import '../../../core/constant/Strings.dart';
import '../../../core/custom/appbar/CustomAppBar.dart';
import '../../../core/custom/button/CustomSearch.dart';
import '../../../core/custom/container/CustomFavorite.dart';
import '../../../core/model/Favorite.dart';


class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController controller = TextEditingController();

  final List<Favorite> favorite = [
    Favorite(AppText.name, ImagesPath.person),
    Favorite(AppText.company, ImagesPath.logoCat_png),
    Favorite(AppText.name, ImagesPath.person),
    Favorite(AppText.company, ImagesPath.logoCat_png),
    Favorite(AppText.name, ImagesPath.person),
    Favorite(AppText.company, ImagesPath.logoCat_png),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppText.favorite),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Container(
                    width: 380,
                    height:40,
                    child: CustomSearchBar(controller: controller)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 5.0, // Spacing between rows
                crossAxisSpacing: 2.0, // Spacing between columns
              ),
              itemCount: 6, // Number of items in the grid
              itemBuilder: (context, index) {
                final item = favorite[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                      onTap: () {},
                      child: CustomFavoriteContainer(
                        favorite: item,
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}