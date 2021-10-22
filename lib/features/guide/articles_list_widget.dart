import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/extension_functions.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/guide/articles_list_view_model.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:mobile_endoendo/features/models/articles_category_model.dart';
import 'package:mobile_endoendo/widgets/exception_widget.dart';
import 'package:mobile_endoendo/widgets/progress_widget.dart';

import 'article_large_thumb_widget.dart';

class ArticlesListWidget extends StatefulWidget {
  static const routeName = '/articles_list';

  const ArticlesListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends BaseWidgetState<ArticlesListWidget, ArticlesListViewModel> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticlesCategory;
    viewModel.setCategory(args);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.bodyText1,
          title: Text(viewModel.title),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
        ),
        body: FutureBuilder(
            future: viewModel.getArticles(),
            builder: (BuildContext context, AsyncSnapshot<List<ArticleUiModel>> snapshot) {
              if (snapshot.loaded) {
                return ListView.builder(
                  padding: const EdgeInsets.only(left: marginRegular, right: marginRegular),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ArticleLargeThumbnailWidget(snapshot.data![index]),
                );
              }
              if (snapshot.hasError) {
                return ExceptionWidget();
              }
              return const ProgressWidget();
            }));
  }
}
