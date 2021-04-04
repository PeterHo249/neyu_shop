import 'package:flutter/material.dart';
import 'package:neyu_shop/utils/constant.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';

class ServiceRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildRowTile(context,
                    iconPath: freeShippingIconPath,
                    title: 'Free Shipping',
                    content: 'Free shipping in Ho Chi Minh city.'),
                _buildRowTile(context,
                    iconPath: codIconPath,
                    title: getWindowType(MediaQuery.of(context).size.width) !=
                            WindowType.small
                        ? 'Cash on Delivery'
                        : 'COD Payment',
                    content: 'You will pay when receiving your goods.'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowTile(
    BuildContext context, {
    required String iconPath,
    required String title,
    required String content,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textWidth = getWindowType(screenWidth) == WindowType.large
        ? 250.0
        : screenWidth * 0.45 - 100;
    return Container(
      width: screenWidth * 0.45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(iconPath),
              radius: 35.0,
              backgroundColor: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: textWidth,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              ),
              Container(
                width: textWidth,
                child: Text(
                  content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
