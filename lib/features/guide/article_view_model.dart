import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';

class ArticleViewModel extends BaseViewModel {
  late final ArticleUiModel _uiModel;

  String get text => _uiModel.text;

  void setArticle(ArticleUiModel args) {
    _uiModel = args;
  }
}
