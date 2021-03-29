import 'package:flutter/material.dart';
import 'package:neyu_shop/utils/action_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Placeholder(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('img/placeholder.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'NEYU Shop',
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
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: MediaQuery.of(context).size.width > 500.0
              ? Text(actionData.title)
              : Icon(actionData.icon),
        ),
      ),
    );
  }
}
