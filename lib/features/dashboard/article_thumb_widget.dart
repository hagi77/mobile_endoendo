import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/guide/article_widget.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:mobile_endoendo/widgets/network_image_builder.dart';
import 'package:mobile_endoendo/widgets/outlined_card.dart';

import 'article_thumb_view_model.dart';

class ArticleThumbnailWidget extends StatefulWidget {
  final ArticleUiModel _uiModel;

  const ArticleThumbnailWidget(this._uiModel, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticleThumbnailWidgetState();
}

class _ArticleThumbnailWidgetState
    extends BaseWidgetState<ArticleThumbnailWidget, ArticleThumbViewModel> {
  @override
  void initState() {
    viewModel.setData(widget._uiModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => OutlinedCard(
        child: InkWell(
            onTap: () =>
                Navigator.pushNamed(context, ArticleWidget.routeName, arguments: widget._uiModel),
            child: Row(
              children: [
                NetworkImageBuilder(viewModel.getImage()),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(
                            marginMedium, marginSmall, marginSmall, marginSmall),
                        child: Text(
                          viewModel.title,
                          style: Theme.of(context).textTheme.headline3,
                          maxLines: 1,
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(marginMedium, 0, marginSmall, marginSmall),
                        child: Text(
                          viewModel.subtitle,
                          style: Theme.of(context).textTheme.bodyText2,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                )),
                const Icon(Icons.navigate_next),
              ],
            )),
      );
}
