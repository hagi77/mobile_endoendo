class Article {
  final String id;

  final String imageFile;

  final String textFile;

  final String title;

  final String lead;

  String? text;

  Article(
      {required this.id,
      required this.imageFile,
      required this.textFile,
      required this.title,
      required this.lead});

  Article.fromJSON(String articleId, Map<String, Object?> json)
      : this(
      id: articleId,
            imageFile: json['image_file']! as String,
            textFile: json['text_file']! as String,
            title: json['title']! as String,
            lead: json['lead']! as String);

  Map<String, Object?> toJson() => {
        //noop
      };
}
