import 'package:flutter/material.dart';
import 'package:neyu_shop/utils/action_data.dart';
import 'package:neyu_shop/utils/constant.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
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
      flexibleSpace: Align(
        alignment: Alignment.centerLeft,
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
      actions: [
        CartActionButton(
          productCount: 3,
        ),
        // ...ActionDataEnum.actionDatas
        //     .asMap()
        //     .map(
        //       (i, actionData) {
        //         return MapEntry(
        //           i,
        //           _buildAppBarAction(
        //             context,
        //             actionData,
        //           ),
        //         );
        //       },
        //     )
        //     .values
        //     .toList(),
      ],
    );
  }

  Widget _buildAppBarAction(BuildContext context, ActionData actionData) {
    return InkWell(
      onTap: actionData.action,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Center(
          child: getWindowType(MediaQuery.of(context).size.width) !=
                  WindowType.small
              ? Text(
                  actionData.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                )
              : Icon(
                  actionData.icon,
                  color: Colors.black,
                  size: 30.0,
                ),
        ),
      ),
    );
  }
}
