import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/guide/article_widget.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:mobile_endoendo/widgets/network_image_builder.dart';
import 'package:mobile_endoendo/widgets/outlined_card.dart';
import 'package:mobile_endoendo/widgets/padded_chip.dart';

import 'article_large_thumb_view_model.dart';

class ArticleLargeThumbnailWidget extends StatefulWidget {
  final ArticleUiModel _uiModel;

  const ArticleLargeThumbnailWidget(this._uiModel, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticleLargeThumbnailWidgetState();
}

class _ArticleLargeThumbnailWidgetState
    extends BaseWidgetState<ArticleLargeThumbnailWidget, ArticleLargeThumbViewModel> {
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
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(marginMedium, 0, marginSmall, marginSmall),
                          child: Text(
                            viewModel.subtitle,
                            style: Theme.of(context).textTheme.bodyText2,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ))
                    ],
                  )),
                  const Padding(
                      padding: EdgeInsets.all(marginTiny), child: Icon(Icons.navigate_next)),
                ],
              ),
              if (viewModel.hasTags)
                Padding(
                  padding: const EdgeInsets.only(
                      left: marginTiny, right: marginTiny, bottom: marginTiny),
                  child: Row(
                    children: [...viewModel.tags.map((tag) => PaddedChip(label: tag))],
                  ),
                )
            ])),
      );
}
