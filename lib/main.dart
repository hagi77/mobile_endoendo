import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';

import 'core/theme.dart';
import 'features/dashboard/dashboard_widget.dart';

void main() {
  setupDI();
  runApp(const MyApp());
}

void setupDI() {
  GetIt.I.registerSingletonAsync<ArticlesRepository>(
      () async => ArticlesRepoMock());
  GetIt.I.registerSingletonWithDependencies<DashboardViewModel>(
      () => DashboardViewModel(),
      dependsOn: [ArticlesRepository]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EndoEndo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primaryColor,
        backgroundColor: surfaceColor,
        scaffoldBackgroundColor: surfaceColor,
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        fontFamily: 'Roboto',
        textTheme: textThemes,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const DashboardWidget(title: 'Flutter Demo Home Page'),
    );
  }
}
