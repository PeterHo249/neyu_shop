import 'package:flutter/material.dart';
import 'package:neyu_shop/views/elements/banner_carousel.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';
import 'package:neyu_shop/views/elements/product_grid.dart';
import 'package:neyu_shop/views/elements/service_row.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildHomepageContent(context),
    );
  }

  Widget _buildHomepageContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Appbar
        MainAppBar(),
        // Corousel
        BannerCarousel(),
        // Service row
        ServiceRow(),
        // Main content
        ProductGrid(),
        // Footer
        InformationFooter(),
      ],
    );
  }
}
