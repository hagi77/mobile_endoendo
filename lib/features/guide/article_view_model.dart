import 'dart:typed_data';

import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleViewModel extends BaseViewModel {
  late ArticleUiModel _uiModel;

  String get text => _uiModel.text;

  Uint8List? get headerImage => _uiModel.leadImage;

  bool get hasTags => _uiModel.tags.isNotEmpty;

  List<String> get tags => _uiModel.tags;

  void setArticle(ArticleUiModel args) {
    _uiModel = args;
  }

  Future<void> urlTapped(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
