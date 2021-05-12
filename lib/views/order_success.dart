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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: Text('Continue shopping'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(
                      15.0,
                    ),
                  ),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 16.0,
                  )),
                  foregroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.amber[400];
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.amber[60];
                      return Colors.amber;
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        InformationFooter(),
      ],
    );
  }
}
