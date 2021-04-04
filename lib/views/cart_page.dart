import 'package:flutter/material.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCartPageContent(context),
    );
  }

  Widget _buildCartPageContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MainAppBar(),
        SliverToBoxAdapter(
          child: Text('This is cart page'),
        ),
        InformationFooter(),
      ],
    );
  }
}
