import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/features/authenticate/login_view_model.dart';
import 'package:mobile_endoendo/features/dashboard/article_thumb_view_model.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/features/guide/article_view_model.dart';
import 'package:mobile_endoendo/features/guide/article_widget.dart';
import 'package:mobile_endoendo/features/guide/articles_list_view_model.dart';
import 'package:mobile_endoendo/features/home/home_view_model.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';
import 'package:mobile_endoendo/repositories/images_repository.dart';
import 'package:mobile_endoendo/widgets/exception_widget.dart';
import 'package:mobile_endoendo/widgets/progress_widget.dart';

import 'core/theme.dart';
import 'features/authenticate/login_widget.dart';
import 'features/guide/article_large_thumb_view_model.dart';
import 'features/guide/articles_list_widget.dart';
import 'features/home/home_widget.dart';

void main() {
  runApp(const MyApp());
}

Future<void> setupDI() {
  GetIt.I.registerSingletonAsync<FirebaseApp>(() => Firebase.initializeApp());

  GetIt.I.registerSingletonWithDependencies<ArticlesRepository>(() => ArticlesRepositoryImpl(),
      dependsOn: [FirebaseApp]);
  GetIt.I.registerSingletonWithDependencies<ImagesRepository>(() => ImagesRepositoryImpl(),
      dependsOn: [FirebaseApp]);

  GetIt.I.registerSingletonWithDependencies<DashboardViewModel>(() => DashboardViewModel(),
      dependsOn: [ArticlesRepository]);
  GetIt.I.registerSingletonWithDependencies<ArticleViewModel>(() => ArticleViewModel(),
      dependsOn: [ArticlesRepository]);
  GetIt.I.registerFactory<ArticleThumbViewModel>(() => ArticleThumbViewModel());
  GetIt.I.registerFactory<ArticleLargeThumbViewModel>(() => ArticleLargeThumbViewModel());
  GetIt.I.registerFactory<ArticlesListViewModel>(() => ArticlesListViewModel());
  GetIt.I.registerSingleton<LoginViewModel>(LoginViewModel());
  GetIt.I.registerSingleton<HomeViewModel>(HomeViewModel());

  return GetIt.I.allReady();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<void> diSetup = setupDI();

  bool get userSignedId => FirebaseAuth.instance.currentUser != null;

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
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
            body: FutureBuilder(
                future: diSetup,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return ExceptionWidget();
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (userSignedId) {
                      return const HomeWidget();
                    } else {
                      return const LoginWidget();
                    }
                  }

                  return const ProgressWidget();
                })),
        ArticleWidget.routeName: (context) => const ArticleWidget(),
        ArticlesListWidget.routeName: (context) => const ArticlesListWidget(),
      },
    );
  }
}
