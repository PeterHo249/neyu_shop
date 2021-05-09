// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neyu_shop/utils/constant.dart';

class BannerCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider(
        items: bannerPaths
            .asMap()
            .map(
              (index, bannerPath) {
                return MapEntry(
                  index,
                  Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: Image.network(
                          bannerPath,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                );
              },
            )
            .values
            .toList(),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.3,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: Duration(
            seconds: 3,
          ),
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
