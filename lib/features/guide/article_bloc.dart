import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';

abstract class ArticleEvent {}

class ArticleBloc extends Bloc<ArticleEvent, ArticleUiModel> {
  ArticleBloc(ArticleUiModel articleUiModel) : super(articleUiModel);
}
