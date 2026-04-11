import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/most_recent_provider.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class MostRecentlyWidget extends StatefulWidget {
  const MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //todo: this code will be executed before build method
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //todo: this code will be executed after build method
      mostRecentProvider.readMostRecentSuraList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecently.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Most Recently", style: AppStyle.bold16White),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: mostRecentProvider.mostRecently.length,
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.02),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            QuranResources.englishSurahNames[mostRecentProvider
                                .mostRecently[index]],
                            style: AppStyle.bold24Black,
                          ),
                          Text(
                            QuranResources.arabicSurahNames[mostRecentProvider
                                .mostRecently[index]],
                            style: AppStyle.bold24Black,
                          ),
                          Text(
                            "${QuranResources.versesCount[mostRecentProvider.mostRecently[index]]}",
                            style: AppStyle.bold14Black,
                          ),
                        ],
                      ),
                      Image.asset(AppAssets.mostRecently, fit: BoxFit.cover),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
