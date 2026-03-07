import 'package:flutter/material.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
            decoration: InputDecoration(
              enabledBorder: buildOutlineInputBorder(),
              hintText: "Sura Name",
              hintStyle: AppStyle.bold16White,
              prefixIcon: Image.asset(AppAssets.search_icon),
              focusedBorder: buildOutlineInputBorder(),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text("Most Recently", style: AppStyle.bold16White),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
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
                          Text("AL-Anbyia", style: AppStyle.bold24Black),
                          Text("الآنبياء", style: AppStyle.bold24Black),
                          Text("112 verses", style: AppStyle.bold14Black),
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

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor),
    );
  }
}
