import 'package:flutter/material.dart';
import 'package:neyu_shop/utils/constant.dart';

class InformationFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 230,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildLogoPane(context),
            _buildInfomationPane(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoPane(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(logoPath),
              radius: 50,
            ),
            Text(
              shopName,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfomationPane(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100.0,
              child: Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
            _buildContactInfoTile(
              context,
              icon: Icons.place_outlined,
              info: 'Street, Dist, City',
              multiline: true,
            ),
            _buildContactInfoTile(
              context,
              icon: Icons.phone,
              info: '090 0000 000',
            ),
            _buildContactInfoTile(
              context,
              icon: Icons.public,
              info: 'website.com',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoTile(
    BuildContext context, {
    required IconData icon,
    required String info,
    bool multiline = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              info,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: multiline ? 2 : 1,
            ),
          ),
        ],
      ),
    );
  }
}
