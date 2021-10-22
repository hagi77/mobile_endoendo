import 'dart:typed_data';

import 'package:mobile_endoendo/repositories/data/article.dart';

class ArticleUiModel {
  final String title;
  final String subtitle;
  final String leadImageFile;
  Uint8List? leadImage;
  final String text;
  final List<String> tags;

  ArticleUiModel.from(Article data)
      : title = data.title,
        subtitle = data.lead,
        leadImageFile = data.imageFile,
        text = data.text ?? "",
        tags = data.tags;
}
