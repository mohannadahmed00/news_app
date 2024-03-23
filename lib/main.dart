import 'package:flutter/material.dart';
import 'package:news_app/providers/main_provider.dart';
import 'package:news_app/screens/home_layout.dart';
import 'package:news_app/shared/styles/my_themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var mainProvide = MainProvider();
    return MaterialApp(
      theme: MyThemeData.lightThemeData,
      themeMode: mainProvide.themeMode,
      locale: mainProvide.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {HomeLayout.routeName: (context) => const HomeLayout()},
    );
  }
}
