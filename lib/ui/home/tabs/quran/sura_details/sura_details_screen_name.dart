import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/ui/home/tabs/quran/sura_details/sura_content.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/most_recent_provider.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.readMostRecentSuraList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    if (verses.isEmpty) loadSuraFile(index);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishSurahNames[index],
          style: AppStyle.bold20Primary,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.blackBgColor,
            child: Image.asset(
              AppAssets.details_bg,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(height * 0.04),
            child: Column(
              children: [
                Text(
                  QuranResources.arabicSurahNames[index],
                  style: AppStyle.bold24Primary,
                ),
                verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.only(top: height * 0.02),
                          itemBuilder: (context, index) {
                            return SuraContent(
                              content: verses[index],
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10);
                          },
                          itemCount: verses.length,
                        ),
                      ),
                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/Suras/${index + 1}.txt",
    );
    List<String> splitContent = fileContent.split("\n");
    verses = splitContent;
    setState(() {});
  }
}
