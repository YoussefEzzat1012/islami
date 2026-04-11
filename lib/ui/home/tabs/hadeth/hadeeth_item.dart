import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadeeth_model.dart';
import 'package:islami/utils/app_routes.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class HadeethItem extends StatefulWidget {
  final int index;

  HadeethItem({super.key, required this.index});

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  Hadeeth? hadeeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(AppRoutes.hadeethDetailsScreen, arguments: hadeeth);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: width * 0.02,
          right: width * 0.02,
          top: height * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/images/HadithCardBackGround.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: hadeeth == null
            ? Center(
                child: CircularProgressIndicator(color: AppColors.blackBgColor),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/cornerRight.png",
                        width: width * 0.2,
                        color: AppColors.blackBgColor,
                      ),
                      Expanded(
                        child: Text(
                          hadeeth?.title ?? "",
                          style: AppStyle.bold24Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(
                        "assets/images/cornerLeft.png",
                        width: width * 0.2,
                        color: AppColors.blackBgColor,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeeth?.content ?? "",
                        style: AppStyle.bold16Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/bottBg.png",
                    color: AppColors.blackBgColor,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
      ),
    );
  }

  void loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/Hadeeth/h$index.txt",
    );
    int fileLineIndex = fileContent.indexOf("\n");
    String title = fileContent.substring(0, fileLineIndex);
    String content = fileContent.substring(fileLineIndex + 1);
    hadeeth = Hadeeth(title, content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
