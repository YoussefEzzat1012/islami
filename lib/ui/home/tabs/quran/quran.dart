import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/ui/home/tabs/quran/sura_item.dart';
import 'package:islami/ui/home/tabs/quran/widgets/most_recently_widget.dart';
import 'package:islami/utils/app_routes.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/shared_prefs_helper.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filtedList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            style: AppStyle.bold16White,
            onChanged: (newText) {
              searchByNewText(newText);
            },
            decoration: InputDecoration(
              enabledBorder: buildOutlineInputBorder(),
              hintText: "Sura Name",
              hintStyle: AppStyle.bold16White,
              prefixIcon: Image.asset(AppAssets.search_icon),
              focusedBorder: buildOutlineInputBorder(),
            ),
          ),
          SizedBox(height: height * 0.02),
          MostRecentlyWidget(),
          SizedBox(height: height * 0.02),
          Text("Sura List", style: AppStyle.bold16White),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  //todo: save last sura index
                    onTap: () {
                      saveLastSuraIndex(filtedList[index]);
                      Navigator.of(context).pushNamed(
                          AppRoutes.suraDetailsScreenName,
                          arguments: filtedList[index]);
                    },
                    child: SuraItem(index: filtedList[index],));
              },
              separatorBuilder: (context, index) {
                return Divider(
                  endIndent: width * 0.10,
                  indent: width * 0.10,
                );
              },
              itemCount: filtedList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor),
    );
  }

  void searchByNewText(String newText) {
    List<int> resultList = [];
    for (int i = 0; i < QuranResources.englishSurahNames.length; i++) {
      if (QuranResources.englishSurahNames[i].toLowerCase().contains(
          newText.toLowerCase())) {
        resultList.add(i);
      }
    }

    for (int i = 0; i < QuranResources.arabicSurahNames.length; i++) {
      if (QuranResources.arabicSurahNames[i].contains(newText)) {
        resultList.add(i);
      }
    }
    filtedList = resultList;
    setState(() {

    });
  }
}
