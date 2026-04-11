import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'hadeeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return CarouselSlider(
      options: CarouselOptions(
          height: height * 0.66,
          enableInfiniteScroll: true,
          enlargeCenterPage: true
      ),
      items: List.generate(50, (index) => index + 1).map((i) {
        return HadeethItem(index: i);
      }).toList(),
    );
  }
}

