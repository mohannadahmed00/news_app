import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/tabs/widgets/category_widget.dart';
import 'package:provider/provider.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Pick your category of interest",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    CategoryModel category =homeProvider.categories[index];
                    homeProvider.selectTab(category.title);
                  },
                  child: CategoryWidget(homeProvider.categories[index], index));
            },
            itemCount: homeProvider.categories.length,
          ),
        ),
      ],
    );
  }
}
