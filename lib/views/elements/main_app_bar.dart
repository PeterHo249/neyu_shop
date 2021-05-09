import 'package:flutter/material.dart';
import 'package:neyu_shop/utils/constant.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:neyu_shop/views/blogpost_page.dart';
import 'package:neyu_shop/views/cart_page.dart';
import 'package:neyu_shop/views/elements/FadePageRoute.dart';
import 'package:neyu_shop/views/elements/cart_action_button.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar()
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super();

  @override
  final Size preferredSize;

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var appBarHeight = 80.0;
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      collapsedHeight: appBarHeight,
      toolbarHeight: appBarHeight,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      flexibleSpace: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.08),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(logoPath),
                  radius: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shopName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        ...buildDrawer(context),
        CartActionButton(
          action: () {
            Navigator.of(context).push(
              FadePageRoute(
                CartPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  List<Widget> buildDrawer(BuildContext context) {
    List<Widget> drawerItems = [];

    var textStyle = TextStyle(
      color: Colors.black,
      fontSize: 18.0,
    );

    if (getWindowType(MediaQuery.of(context).size.width) == WindowType.large) {
      drawerItems.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              FadePageRoute(
                BlogpostPage("matong"),
              ),
            );
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Honey",
                style: textStyle,
              ),
            ),
          ),
        ),
      );
    } else {
      drawerItems.add(
        PopupMenuButton(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.segment,
              size: 30.0,
            ),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text(
                  "Honey",
                  style: textStyle,
                ),
                value: "matong",
              ),
            ];
          },
          onSelected: (String value) {
            Navigator.of(context).push(
              FadePageRoute(
                BlogpostPage(value),
              ),
            );
          },
        ),
      );
    }

    return drawerItems;
  }
}
