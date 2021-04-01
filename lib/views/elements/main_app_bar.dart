import 'package:flutter/material.dart';
import 'package:neyu_shop/utils/action_data.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';

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
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('assets/img/placeholder.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'NEYU Shop',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.amber.shade200,
      elevation: 0.0,
      actions: ActionDataEnum.actionDatas
          .asMap()
          .map(
            (i, actionData) {
              return MapEntry(
                i,
                _buildAppBarAction(
                  context,
                  actionData,
                ),
              );
            },
          )
          .values
          .toList(),
    );
  }

  Widget _buildAppBarAction(BuildContext context, ActionData actionData) {
    return InkWell(
      onTap: actionData.action,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: getWindowType(MediaQuery.of(context).size.width) !=
                  WindowType.small
              ? Text(
                  actionData.title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              : Icon(
                  actionData.icon,
                  color: Colors.black,
                ),
        ),
      ),
    );
  }
}
