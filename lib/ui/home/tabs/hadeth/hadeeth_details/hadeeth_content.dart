import 'package:flutter/material.dart';

import '../../../../../utils/app_styles.dart';

class HadeethContent extends StatelessWidget {
  final String content;

  const HadeethContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Text(
        content,
        style: AppStyle.bold20Primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
