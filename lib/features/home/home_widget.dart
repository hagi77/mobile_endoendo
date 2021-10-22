import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_widget.dart';
import 'package:mobile_endoendo/features/guide/articles_list_widget.dart';
import 'package:mobile_endoendo/features/home/home_view_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State createState() => _HomeWidgetState();
}

class _HomeWidgetState extends BaseWidgetState<HomeWidget, HomeViewModel> {
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
        body: _getBody(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => viewModel.onBottomNavigation(index),
          currentIndex: viewModel.currentBottomNavigIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: AppLocalizations.of(context)?.appBarHome),
            BottomNavigationBarItem(
                icon: const Icon(Icons.menu_book_outlined),
                label: AppLocalizations.of(context)?.appBarGuide),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: AppLocalizations.of(context)?.appBarFavorites),
          ],
        ));
  }

  Widget _getBody() {
    switch (viewModel.currentBottomNavigIndex) {
      case 1:
        return const ArticlesListWidget();
      default:
        return const DashboardWidget();
    }
  }
}
