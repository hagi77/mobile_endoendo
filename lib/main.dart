import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';
import 'package:mobile_endoendo/widgets/exception_widget.dart';
import 'package:mobile_endoendo/widgets/progress_widget.dart';

import 'core/theme.dart';
import 'features/dashboard/dashboard_widget.dart';

void main() {
  runApp(const MyApp());
}

Future<void> setupDI() {
  GetIt.I.registerSingletonAsync<FirebaseApp>(() => Firebase.initializeApp());

  GetIt.I.registerSingletonWithDependencies<ArticlesRepository>(() => ArticlesRepositoryImpl(),
      dependsOn: [FirebaseApp]);

  GetIt.I.registerSingletonWithDependencies<DashboardViewModel>(() => DashboardViewModel(),
      dependsOn: [ArticlesRepository]);

  return GetIt.I.allReady();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<void> diSetup = setupDI();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EndoEndo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primaryColor,
        backgroundColor: surfaceColor,
        scaffoldBackgroundColor: surfaceColor,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        fontFamily: 'Roboto',
        textTheme: textThemes,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FutureBuilder(
          future: diSetup,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const ExceptionWidget();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return const DashboardWidget();
            }

            return const ProgressWidget();
          }),
    );
  }
}
