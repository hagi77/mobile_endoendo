import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/repositories/images_repository.dart';

class ArticleThumbViewModel extends BaseViewModel {
  final _imagesRepo = GetIt.I<ImagesRepository>();

  late final ArticleUiModel _uiModel;

  String get title => _uiModel.title;

  String get subtitle => _uiModel.subtitle;

  void setData(ArticleUiModel uiModel) {
    _uiModel = uiModel;
  }

  Future<String> getImageUrl() => _imagesRepo.getImageUrl(_uiModel.leadImageFile);

  Future<Uint8List?> getImage() => _imagesRepo.getImage(_uiModel.leadImageFile);
}
