import 'package:flutter/material.dart';

import '../../constant/Strings.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function()? searchQuery;

  CustomSearchBar({super.key, required this.controller,this.searchQuery});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,


      decoration: InputDecoration(
        hintText: AppText.search,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onChanged: (value) {
        // Handle search query changes here
      },
    );
  }}