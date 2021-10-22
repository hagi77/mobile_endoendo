import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:mobile_endoendo/repositories/images_repository.dart';

class ArticleThumbViewModel extends BaseViewModel {
  final _imagesRepo = GetIt.I<ImagesRepository>();

  late final ArticleUiModel uiModel;

  String get title => uiModel.title;

  String get subtitle => uiModel.subtitle;

  void setData(ArticleUiModel uiModel) {
    this.uiModel = uiModel;
  }

  Future<Uint8List?> getImage() =>
      _imagesRepo.getImage(uiModel.leadImageFile).then((value) => uiModel.leadImage = value);
}
