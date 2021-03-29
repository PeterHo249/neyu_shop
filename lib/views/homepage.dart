import 'package:carousel_slider/carousel_slider.dart';
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
      body: _buildHomepageContent(context),
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
          child: MediaQuery.of(context).size.width > 500.0
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

  Widget _buildHomepageContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Corousel
            _buildCarouselHeader(context),
            // Main content
            _buildMainContent(context),
            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselHeader(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3, 4].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Image.network('assets/img/placeholder_wide.png'),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 400.0,
        aspectRatio: 16 / 9,
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      width: 500,
      height: 500,
      child: Text(
        'This is product list',
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: Colors.blue.shade400,
      width: 500,
      height: 500,
      child: Text(
        'This is footer',
      ),
    );
  }
}
