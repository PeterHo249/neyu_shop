import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:neyu_shop/models/blogpost.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';

class BlogpostPage extends StatelessWidget {
  BlogpostPage(this.postId);

  final String postId;

  final Blogpost post = Blogpost(
    "title",
    "Long content",
  );

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
    // TODO: Need some style here
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(post.title),
          MarkdownBody(
            data: post.content,
          ),
        ],
      ),
    );
  }
}
