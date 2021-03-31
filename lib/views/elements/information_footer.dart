import 'package:flutter/material.dart';

class InformationFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'assets/img/placeholder.png',
                      ),
                      radius: 50,
                    ),
                    Text(
                      'NEYU Shop',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'NEYU Shop',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      'Slogan',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '09xxxxxxx',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.public,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'web_address.com',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
