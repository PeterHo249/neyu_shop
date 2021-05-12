import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/blogpost.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/loading_indicator.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';

class BlogpostPage extends StatelessWidget {
  BlogpostPage(this.postId);

  final String postId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBlogpostPageContent(context),
    );
  }

  Widget buildBlogpostPageContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MainAppBar(),
        buildContent(context),
        InformationFooter(),
      ],
    );
  }

  Widget buildContent(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 15.0,
        ),
        child: StreamBuilder(
          stream: DataProvider.instance.getBlogpost(postId),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return LoadingIndicator();
            }

            var post = Blogpost.fromJson(
              json.decode(
                json.encode(
                  snapshot.data?.data(),
                ),
              ),
            );

            post.content = post.content.replaceAll('\\n', "\n");

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    post.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Divider(),
                MarkdownBody(
                  data: post.content,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
