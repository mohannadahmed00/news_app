import 'package:flutter/material.dart';
import 'package:news_app/shared/styles/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width * .7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              width: double.infinity,
              color: AppColors.green,
              child: Text(
                "News App",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white, fontSize: 24),
              )),
          GestureDetector(
            onTap: () {
              homeProvider.selectTab("Categories");
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.format_list_bulleted_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    "Categories",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeProvider.selectTab("Settings");
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  Text(
                    "Settings",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
