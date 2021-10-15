import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/features/guide/article_widget.dart';

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
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ArticleWidget.routeName, arguments: widget._uiModel);
      },
      child: Card(
        child: Row(
          children: [
            FutureBuilder(
                future: viewModel.getImageUrl(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Image(
                      image: NetworkImage(snapshot.data as String),
                      fit: BoxFit.fitHeight,
                      width: 76,
                      height: 76,
                    );
                  } else {
                    return Container(
                      width: 76,
                      height: 76,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator.adaptive(),
                    );
                  }
                }),
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
                    padding: const EdgeInsets.fromLTRB(marginMedium, 0, marginSmall, marginSmall),
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
        ),
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Colors.black, width: outlineThickness, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(outlineRadius)),
        clipBehavior: Clip.hardEdge,
        elevation: 0,
      ));
}
