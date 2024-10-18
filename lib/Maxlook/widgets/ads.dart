import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../utils/constants.dart';

class Ads extends StatelessWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: 160,
      ),
      items: adsData
          .map(
            (item) => Container(
              width: Conststants(context: context).fullWidth() > 650
                  ? 640
                  : double.maxFinite,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: minPadding),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(minBorderRadius)),
                child: Image.asset(
                  'lib/Maxlook/images/jacket_ad1.jpg',
                  fit: BoxFit.cover,
                  height: 140,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
