import 'package:flutter/material.dart';
import 'package:neyu_shop/views/elements/banner_carousel.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';
import 'package:neyu_shop/views/elements/product_grid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: _buildHomepageContent(context),
    );
  }

  Widget _buildHomepageContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Corousel
        BannerCarousel(),
        // Main content
        ProductGrid(),
        // Footer
        InformationFooter(),
      ],
    );
  }
}
