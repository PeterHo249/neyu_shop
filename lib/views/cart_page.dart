import 'package:flutter/material.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/order.dart';
import 'package:neyu_shop/views/elements/FadePageRoute.dart';
import 'package:neyu_shop/views/elements/customer_form.dart';
import 'package:neyu_shop/views/elements/empty_indicator.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';
import 'package:neyu_shop/views/elements/order_entry_tile.dart';
import 'package:neyu_shop/views/order_success.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCartPageContent(context),
    );
  }

  Widget _buildCartPageContent(BuildContext context) {
    List<Widget> contentParts = [];
    if (DataProvider.instance.currentOrder.entries.length == 0)
      contentParts.add(
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: EmptyDataIndicator(
              message: "Empty cart",
            ),
          ),
        ),
      );
    else {
      contentParts.add(
        SliverToBoxAdapter(
          child: buildOrderEntriesList(context),
        ),
      );
      contentParts.add(
        SliverToBoxAdapter(
          child: buildDeliveryForm(context),
        ),
      );
      contentParts.add(
        SliverToBoxAdapter(
          child: buildSubmitButton(context),
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        MainAppBar(),
        ...contentParts,
        InformationFooter(),
      ],
    );
  }

  Widget buildOrderEntriesList(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DataProvider.instance.currentOrder,
      child: Consumer<Order>(
        builder: (context, order, _) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...order.entries
                    .map((entry) => OrderEntryTile(orderEntry: entry))
                    .toList(),
                Divider(),
                Text("Total quality: ${order.computeAmount()}"),
                Text("Total cost: ${order.totalValue}"),
              ]);
        },
      ),
    );
  }

  Widget buildDeliveryForm(BuildContext context) {
    return CustomerForm();
  }

  Widget buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Summit form");
        // TODO: Implement submit order here
        Navigator.of(context).push(
          FadePageRoute(
            SuccessOrder(),
          ),
        );
      },
      child: Text('Order'),
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
                states.contains(MaterialState.pressed)) return Colors.amber[60];
            return Colors.amber;
          },
        ),
      ),
    );
  }
}
