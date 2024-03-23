import 'package:flutter/material.dart';
import 'package:news_app/models/sources/sources.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/styles/app_colors.dart';
import 'package:news_app/tabs/widgets/chip_widget.dart';
import 'package:news_app/tabs/widgets/news_widget.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatelessWidget {
  final List<Sources> resources;

  const NewsTab(this.resources, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      builder: (context, child) {
        var homeProvider = Provider.of<HomeProvider>(context);
        var newsProvider = Provider.of<NewsProvider>(context);
        return Column(
          children: [
            DefaultTabController(
              length: resources.length,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  newsProvider.selectChip(index);
                },
                tabs: resources.map((resource) {
                  return ChipWidget(resource,
                      resources.indexOf(resource) == newsProvider.chipIndex);
                }).toList(),
              ),
            ),
            FutureBuilder(
                future: ApiManager.getNews(
                    homeProvider.search, resources[newsProvider.chipIndex].id!),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Expanded(child: Center(child: CircularProgressIndicator(color: AppColors.green,)));
                  }
                  if (snap.hasError) {
                    return Expanded(
                      child: Column(
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
                      ),
                    );
                  }
                  if (snap.data?.status != "ok") {
                    return Expanded(
                      child: Column(
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
                      ),
                    );
                  }
                  var news = snap.data?.articles ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return NewsWidget(news[index]);
                      },
                      itemCount: news.length,
                    ),
                  );
                })
          ],
        );
      },
    );
  }
}
