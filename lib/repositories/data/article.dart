class Article {
  final String id;

  final String thumbUrl;

  final String title;

  final String lead;

  final String text;

  const Article(
      {required this.id,
      required this.thumbUrl,
      required this.title,
      required this.lead,
      required this.text});

  Article.fromJSON(String articleId, Map<String, Object?> json)
      : this(
            id: articleId,
            thumbUrl: "",
            title: json['title']! as String,
            lead: json['lead']! as String,
            text: json['text']! as String);

  Map<String, Object?> toJson() => {
        //noop
      };
}
