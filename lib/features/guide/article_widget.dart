import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';

import 'article_view_model.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  State createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends BaseWidgetState<ArticleWidget, ArticleViewModel> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.black,
                ))
          ],
        ),
      );
}
