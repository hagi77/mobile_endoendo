import 'package:mobile_endoendo/core/extension_functions.dart';

class Article {
  final String id;

  final String imageFile;

  final String textFile;

  final String title;

  final String lead;

  String? text;

  List<String> tags;

  Article(
      {required this.id,
      required this.imageFile,
      required this.textFile,
      required this.title,
      required this.lead,
      required this.tags});

  Article.fromJSON(String articleId, Map<String, Object?> json)
      : this(
            id: articleId,
            imageFile: json['image_file']! as String,
            textFile: json['text_file']! as String,
            title: json['title']! as String,
            lead: json['lead']! as String,
            tags: (json['tags'] as List<dynamic>?).parseStringsList());

  Map<String, Object?> toJson() => {
    //noop
  };
}
