import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/theme.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';

import 'article_view_model.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  State createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends BaseWidgetState<ArticleWidget, ArticleViewModel> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticleUiModel;
    viewModel.setArticle(args);

    Image headerImage;

    if (viewModel.headerImage != null) {
      headerImage = Image.memory(
        viewModel.headerImage!,
        fit: BoxFit.cover,
      );
    } else {
      headerImage = Image.asset(
        'lib/images/placeholder.jpg',
        fit: BoxFit.cover,
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, scrolled) => [
          SliverAppBar(
            backgroundColor: toolbarBgkColor,
            foregroundColor: Colors.black,
            expandedHeight: 180.0,
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
          data: viewModel.text,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
        ),
      ),
    );
  }
}
