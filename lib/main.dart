import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeeth_details/hadeeth_details_screen.dart';
import 'package:islami/ui/home/tabs/quran/sura_details/sura_details_screen_name.dart';
import 'package:islami/ui/home/tabs/quran/sura_details1/sura_details_screen_name1.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsScreenName: (context) => SuraDetails(),
        AppRoutes.suraDetailsScreenName1: (context) => SuraDetailsScreen1(),
        AppRoutes.hadeethDetailsScreen: (context) => HadeethDetailsScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
