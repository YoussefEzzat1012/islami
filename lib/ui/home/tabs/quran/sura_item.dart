import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  final int index;

  const SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppAssets.sura_vector),
          Text('${index + 1}', style: AppStyle.bold20White),
        ],
      ),
      title: Text(
        QuranResources.englishSurahNames[index],
        style: AppStyle.bold20White,
      ),
      subtitle: Text(
        "${QuranResources.versesCount[index]}",
        style: AppStyle.bold14White,
      ),
      trailing: Text(
        QuranResources.arabicSurahNames[index],
        style: AppStyle.bold20White,
      ),
    );
  }
}
