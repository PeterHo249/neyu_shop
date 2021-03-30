import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3, 4].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Image.network(
                'assets/img/placeholder_wide.png',
                fit: BoxFit.fill,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 300.0,
        viewportFraction: 0.9,
        autoPlay: true,
        autoPlayInterval: Duration(
          seconds: 3,
        ),
        enlargeCenterPage: true,
      ),
    );
  }
}
