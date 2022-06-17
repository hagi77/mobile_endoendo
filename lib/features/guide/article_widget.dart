import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mobile_endoendo/core/theme.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'article_bloc.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticleUiModel;

    return BlocBuilder<ArticleBloc, ArticleUiModel>(
        bloc: ArticleBloc(args),
        builder: (context, state) {
          Image headerImage;

          if (state.leadImage != null) {
            headerImage = Image.memory(
              state.leadImage!,
              fit: BoxFit.cover,
            );
          } else {
            headerImage = Image.asset(
              'images/placeholder.jpg',
              fit: BoxFit.cover,
            );
          }

          return Scaffold(
              body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, scrolled) => [
                SliverAppBar(
                  backgroundColor: toolbarBgkColor,
                  foregroundColor: Colors.black,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: headerImage,
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.black,
                        ))
                  ],
                )
              ],
              body: Markdown(
                padding: const EdgeInsets.all(marginRegular),
                data: state.text,
                styleSheet: getMarkdownStyleSheet(context),
                onTapLink: (text, href, title) {
                  if (href != null) {
                    _navigateToUrl(href);
                  }
                },
              ),
            ),
          ));
        });
  }
}

void _navigateToUrl(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
