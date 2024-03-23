import 'package:flutter/material.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/shared/styles/app_colors.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});


  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    TextEditingController controller = TextEditingController(text: homeProvider.search);
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: AppColors.green,
        ),
        cursorColor: AppColors.green,
        decoration: InputDecoration(
          prefixIcon: IconButton(onPressed: () {
            homeProvider.search="";
            homeProvider.activeSearch(false);}, icon: const Icon(Icons.close),color: AppColors.green),
          suffixIcon: IconButton(onPressed: () {
            homeProvider.activeSearch(false);
            homeProvider.searchAbout(controller.text);
            }, icon: const Icon(Icons.search),color: AppColors.green),
          hintText: 'Search Article...',
          contentPadding: const EdgeInsets.only(top: 20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
