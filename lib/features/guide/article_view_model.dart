import 'dart:typed_data';

import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';

class ArticleViewModel extends BaseViewModel {
  late ArticleUiModel _uiModel;

  String get text => _uiModel.text;

  Uint8List? get headerImage => _uiModel.leadImage;

  void setArticle(ArticleUiModel args) {
    _uiModel = args;
  }
}
