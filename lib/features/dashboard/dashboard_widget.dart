import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';

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
      body: Container(
          padding: const EdgeInsets.fromLTRB(
              marginRegular, 0, marginRegular, marginRegular),
          child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: marginMedium),
                    child: Text(
                      AppLocalizations.of(context)?.dashboardNewsTitle ?? "",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage('lib/images/placeholder.jpg'),
                          fit: BoxFit.fitHeight,
                          width: 68,
                          height: 68,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(marginMedium,
                                    marginSmall, marginSmall, marginTiny),
                                child: Text(
                                  'title',
                                  style: Theme.of(context).textTheme.headline3,
                                  maxLines: 1,
                                )),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(marginMedium,
                                    marginTiny, marginSmall, marginSmall),
                                child: Text('blah blah text',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    maxLines: 2))
                          ],
                        )),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    clipBehavior: Clip.hardEdge,
                  ),
                ]),
          )),
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
}
