import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeeth_details/hadeeth_content.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../../../model/hadeeth_model.dart';

class HadeethDetailsScreen extends StatefulWidget {
  HadeethDetailsScreen({super.key});

  @override
  State<HadeethDetailsScreen> createState() => _HadeethDetailsScreenState();
}

class _HadeethDetailsScreenState extends State<HadeethDetailsScreen> {
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
    Hadeeth hadeeth = ModalRoute.of(context)!.settings.arguments as Hadeeth;
    return Scaffold(
      appBar: AppBar(),
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
                  Text(hadeeth.title, style: AppStyle.bold24Primary),
                  Image.asset(AppAssets.cornerLeft),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: HadeethContent(content: hadeeth.content),
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
}
