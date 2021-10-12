import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
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
