import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/extension_functions.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/features/guide/articles_list_view_model.dart';
import 'package:mobile_endoendo/widgets/article_thumb_widget.dart';
import 'package:mobile_endoendo/widgets/exception_widget.dart';
import 'package:mobile_endoendo/widgets/progress_widget.dart';

class ArticlesListWidget extends StatefulWidget {
  static const routeName = '/articles_list';

  const ArticlesListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends BaseWidgetState<ArticlesListWidget, ArticlesListViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                      ArticleThumbnailWidget(snapshot.data![index]),
                );
              }
              if (snapshot.hasError) {
                return ExceptionWidget();
              }
              return const ProgressWidget();
            }));
  }
}
