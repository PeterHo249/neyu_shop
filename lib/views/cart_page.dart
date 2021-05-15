import 'package:flutter/material.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/order.dart';
import 'package:neyu_shop/views/elements/customer_form.dart';
import 'package:neyu_shop/views/elements/empty_indicator.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';
import 'package:neyu_shop/views/elements/order_entry_tile.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: Text('Back to shop'),
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Total quality: ${order.computeAmount()}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text("-"),
                    Text(
                      "Total cost: ${order.totalValue}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildDeliveryForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomerForm(),
    );
  }
}
