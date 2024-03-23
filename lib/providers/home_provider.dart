import 'package:flutter/widgets.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/shared/styles/app_colors.dart';

class HomeProvider extends ChangeNotifier {
  List categories = [
    CategoryModel(
        imgUrl: "assets/images/ball.png",
        title: "Sports",
        color: AppColors.red),
    CategoryModel(
        imgUrl: "assets/images/politics.png",
        title: "Politics",
        color: AppColors.blue),
    CategoryModel(
        imgUrl: "assets/images/health.png",
        title: "Health",
        color: AppColors.pink),
    CategoryModel(
        imgUrl: "assets/images/business.png",
        title: "Business",
        color: AppColors.brown),
    CategoryModel(
        imgUrl: "assets/images/environment.png",
        title: "Environment",
        color: AppColors.lightBlue),
    CategoryModel(
        imgUrl: "assets/images/science.png",
        title: "Science",
        color: AppColors.yellow),
  ];

  String selectedTab = "Categories";

  void selectTab(String selectedTab) {
    this.selectedTab = selectedTab;
    isSearchableTab(this.selectedTab);
    //notifyListeners();
  }

  bool isSearchable = false;

  void isSearchableTab(String tabTitle) {
    if (tabTitle == "Categories") {
      isSearchable = false;
    } else if (tabTitle == "Settings") {
      isSearchable = false;
    } else {
      isSearchable = true;
    }
    notifyListeners();
  }

  bool isSearchSelected = false;
  void activeSearch(bool status){
    isSearchSelected = status;
    notifyListeners();
  }


  String search="";
  void searchAbout(String searchText){
    search = searchText;
    notifyListeners();
  }
}
