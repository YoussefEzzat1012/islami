import 'package:flutter/material.dart';
import 'package:islami/ui/home/button_navigationBar_item.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeth.dart';
import 'package:islami/ui/home/tabs/quran/quran.dart';
import 'package:islami/ui/home/tabs/radio/radio.dart';
import 'package:islami/ui/home/tabs/sebha/sebha.dart';
import 'package:islami/ui/home/tabs/time/time.dart';
import 'package:islami/utils/app_assets.dart';

import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backGroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Stack(
      children: [
        Image.asset(backGroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.primaryColor,
            ),
            child: BottomNavigationBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {

                  });
                },
                currentIndex: selectedIndex,
                // backgroundColor: AppColors.primaryColor,
                //type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(icon: ButtonNavigationbarIcon(
                    index: 1,
                    iconName: AppAssets.IconQuran,
                    selectedIndex: selectedIndex,), label: 'quran'),
                  BottomNavigationBarItem(icon: ButtonNavigationbarIcon(
                    index: 2,
                    iconName: AppAssets.IconHadeth,
                    selectedIndex: selectedIndex,), label: 'hadeth'),
                  BottomNavigationBarItem(icon: ButtonNavigationbarIcon(
                    index: 3,
                    iconName: AppAssets.IconSebha,
                    selectedIndex: selectedIndex,), label: 'sebha'),
                  BottomNavigationBarItem(icon: ButtonNavigationbarIcon(
                    index: 4,
                    iconName: AppAssets.IconRadio,
                    selectedIndex: selectedIndex,), label: 'radio'),
                  BottomNavigationBarItem(icon: ButtonNavigationbarIcon(
                    index: 5,
                    iconName: AppAssets.IconTime,
                    selectedIndex: selectedIndex,), label: 'time'),

                ]
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.052),
                child: Image.asset(
                  AppAssets.islami_logo, height: height * 0.16,),
              ),
              Expanded(
                child: tabs[selectedIndex],
              )
            ],
          ),
        ),

      ],
    );
  }


}
