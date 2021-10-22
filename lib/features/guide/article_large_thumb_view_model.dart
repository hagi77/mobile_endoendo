import 'package:mobile_endoendo/features/dashboard/article_thumb_view_model.dart';

class ArticleLargeThumbViewModel extends ArticleThumbViewModel {
  bool get hasTags => uiModel.tags.isNotEmpty;

  List<String> get tags => uiModel.tags;
}
