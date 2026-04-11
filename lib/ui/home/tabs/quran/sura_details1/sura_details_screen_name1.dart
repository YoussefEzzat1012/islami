import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/ui/home/tabs/quran/sura_details1/sura_content1.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String suraContent = '';
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
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (suraContent.isEmpty) loadSuraFile(index);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishSurahNames[index],
          style: AppStyle.bold20Primary,
        ),
      ),
      body: Container(
        color: AppColors.blackBgColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.cornerRight),
                  Text(
                    QuranResources.arabicSurahNames[index],
                    style: AppStyle.bold24Primary,
                  ),
                  Image.asset(AppAssets.cornerLeft),
                ],
              ),
            ),
            Expanded(
              child: suraContent.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : SingleChildScrollView(
                      child: SuraContent1(content: suraContent),
                    ),
            ),
            Image.asset(
              AppAssets.bottBg,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/Suras/${index + 1}.txt",
    );
    List<String> suraLines = fileContent.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    suraContent = suraLines.join();
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}

/*
     Stack(
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
            padding:  EdgeInsets.all(height*0.04),
            child: Column(
              children: [
                Text(
                  QuranResources.arabicSurahNames[index],
                  style: AppStyle.bold24Primary,
                ),
                verses.isEmpty? Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )) :
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: height*0.02),
                    itemBuilder: (context, index) {
                      return SuraContent(content: verses[index], index: index,);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: verses.length,
                  ),
                ),
                SizedBox(height: height*0.05),
              ],
            ),
          ),

        ],
      ),
 */
