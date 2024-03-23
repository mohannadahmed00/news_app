import 'package:flutter/material.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/tabs/categories_tab.dart';
import 'package:news_app/tabs/news_tab.dart';
import 'package:news_app/tabs/settings_tab.dart';
import 'package:news_app/tabs/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';
import '../shared/network/remote/api_manager.dart';
import '../shared/styles/app_colors.dart';
import '../tabs/widgets/search_widget.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "HomeLayout";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        var homeProvider = Provider.of<HomeProvider>(context);
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/background.png",
              fit: BoxFit.fill,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              drawer: homeProvider.isSearchSelected?null:const DrawerWidget(),
              appBar: AppBar(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                title: homeProvider.isSearchSelected?SearchWidget():Text(
                  homeProvider.selectedTab == "Categories"
                      ? "News App"
                      : homeProvider.selectedTab == "Settings"
                          ? "Settings"
                          : homeProvider.selectedTab,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                ),
                centerTitle: true,
                actions: [
                  Visibility(
                    visible: homeProvider.isSearchable && !homeProvider.isSearchSelected,
                    child: IconButton(
                        onPressed: () {
                          homeProvider.activeSearch(true);
                        },
                        icon: const Icon(Icons.search)),
                  )
                ],
              ),
              body: FutureBuilder(
                  future: ApiManager.getResources(homeProvider.selectedTab.toLowerCase()),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color: AppColors.green,));
                    }
                    if (snap.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              child: Text("Something went wrong !!",textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.green),)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.5,
                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green, // Set the background color of the button
                                ),
                                onPressed: (){}, child: Text("Try Again",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white))),
                          )
                        ],
                      );
                    }
                    if (snap.data?.status != "ok") {
                      print(snap.data?.status);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              child: Text("Something went wrong !!",textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.green),)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.5,
                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green, // Set the background color of the button
                                ),
                                onPressed: (){}, child: Text("Try Again",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white))),
                          )
                        ],
                      );
                    }
                    var resources = snap.data?.sources ?? [];
                    return homeProvider.selectedTab == "Categories"
                        ? const CategoriesTab()
                        : homeProvider.selectedTab == "Settings"
                            ? const SettingsTab()
                            : NewsTab(resources);
                  }),
            ),
          ],
        );
      },
    );
  }
}
