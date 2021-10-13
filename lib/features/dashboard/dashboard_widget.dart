import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/widgets/article_thumb_widget.dart';
import 'package:mobile_endoendo/widgets/exception_widget.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardWidget> createState() => _DashboardState();
}

class _DashboardState
    extends BaseWidgetState<DashboardWidget, DashboardViewModel> {
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
          future: viewModel.getNews(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ArticleUiModel>> snapshot) {
            Widget child = Text('dd');

            if (snapshot.hasData && snapshot.requireData.isNotEmpty) {
              child = Container(
                padding: const EdgeInsets.fromLTRB(
                    marginRegular, 0, marginRegular, marginRegular),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getNewsSection(snapshot.requireData)),
              );
            } else if (snapshot.hasError) {
              child = ExceptionWidget();
            }

            return child;
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)?.appBarHome),
          BottomNavigationBarItem(
              icon: const Icon(Icons.menu_book_outlined),
              label: AppLocalizations.of(context)?.appBarGuide),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: AppLocalizations.of(context)?.appBarFavorites),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> getNewsSection(List<ArticleUiModel> articles) {
    var articleWidgets = articles.map((item) => ArticleThumbnailWidget(item));
    return <Widget>[
      Container(
          margin: const EdgeInsets.only(bottom: marginMedium),
          child: Text(
            AppLocalizations.of(context)?.dashboardNewsTitle ?? "",
            style: Theme.of(context).textTheme.headline1,
          )),
      ...articleWidgets
    ];
  }
}
