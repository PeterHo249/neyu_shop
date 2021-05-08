import 'package:flutter/material.dart';
import 'package:neyu_shop/views/elements/empty_indicator.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';

class SuccessOrder extends StatelessWidget {
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
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: EmptyDataIndicator(
              message:
                  "Your order was successfully and you will receive a confirmation call.",
              icon: Icons.check_box_rounded,
            ),
          ),
        ),
        InformationFooter(),
      ],
    );
  }
}
