import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/extension_functions.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/features/guide/articles_list_widget.dart';
import 'package:mobile_endoendo/widgets/article_thumb_widget.dart';
import 'package:mobile_endoendo/widgets/exception_widget.dart';
import 'package:mobile_endoendo/widgets/outlined_card.dart';
import 'package:mobile_endoendo/widgets/progress_widget.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardState();
}

class _DashboardState extends BaseWidgetState<DashboardWidget, DashboardViewModel> {
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
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: marginRegular, right: marginRegular),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_getNewsSection(), ..._getGuideSection(context)]))),
      bottomNavigationBar: _getBottomNavBar(context),
    );
  }

  FutureBuilder<List<ArticleUiModel>> _getNewsSection() {
    return FutureBuilder(
        future: viewModel.getNews(),
        builder: (BuildContext context, AsyncSnapshot<List<ArticleUiModel>> snapshot) {
          if (snapshot.loaded) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getNewsItems(snapshot.requireData));
          }
          if (snapshot.hasError) {
            return ExceptionWidget();
          }
          return const ProgressWidget();
        });
  }

  List<Widget> _getNewsItems(List<ArticleUiModel> articles) {
    var articleWidgets = articles.map((item) => ArticleThumbnailWidget(item));
    return <Widget>[
      Container(
          margin: const EdgeInsets.only(bottom: marginMedium, left: superTiny),
          child: Text(
            AppLocalizations.of(context)?.dashboardNewsTitle ?? "",
            style: Theme.of(context).textTheme.headline1,
          )),
      ...articleWidgets
    ];
  }

  List<Widget> _getGuideSection(BuildContext context) {
    const empty = SizedBox(
      width: marginTiny,
      height: marginTiny,
    );

    void addVerticalSeparators(List<Widget> list) {
      int i = 1;
      while (i < list.length) {
        list.insert(i, empty);
        i += 2;
      }
    }

    final guideTopics =
        viewModel.getGuideTopics(context).map((title) => _getGuideTile(title)).toList();
    const itemsPerRow = 3;
    final rowsCount = (guideTopics.length / itemsPerRow).ceil();

    List<TableRow> rows = [];
    int index = 0;
    List<Widget> childrenPerRow;
    Widget cell;

    for (int row = 1; row <= rowsCount; row++) {
      childrenPerRow = [];
      while (index < row * itemsPerRow) {
        if (index < guideTopics.length) {
          cell = guideTopics[index];
        } else {
          cell = empty;
        }
        childrenPerRow.add(cell);
        index++;
      }

      addVerticalSeparators(childrenPerRow);

      rows.add(TableRow(children: childrenPerRow));
      rows.add(TableRow(children: List.filled(childrenPerRow.length, empty)));
    }

    return [
      Container(
          margin: const EdgeInsets.only(top: marginLarge, bottom: marginMedium, left: superTiny),
          child: Text(
            AppLocalizations.of(context)?.dashboardGuideTitle ?? "",
            style: Theme.of(context).textTheme.headline1,
          )),
      Table(
          columnWidths: const {1: FixedColumnWidth(marginTiny), 3: FixedColumnWidth(marginTiny)},
          children: [...rows]),
    ];
  }

  Widget _getGuideTile(String title) {
    return OutlinedCard(
        child: InkWell(
      onTap: () => Navigator.pushNamed(context, ArticlesListWidget.routeName),
      child: Column(children: [
        Image.asset('lib/images/placeholder.jpg'),
        Padding(
            padding: const EdgeInsets.all(marginSmall),
            child: Text(title,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 2,
                textAlign: TextAlign.center))
      ]),
    ));
  }

  BottomNavigationBar _getBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home), label: AppLocalizations.of(context)?.appBarHome),
        BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book_outlined),
            label: AppLocalizations.of(context)?.appBarGuide),
        BottomNavigationBarItem(
            icon: const Icon(Icons.favorite), label: AppLocalizations.of(context)?.appBarFavorites),
      ],
    );
  }
}
