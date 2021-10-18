import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/core/extension_functions.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/features/guide/article_widget.dart';
import 'package:mobile_endoendo/widgets/exception_widget.dart';

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
                future: viewModel.getImage(),
                builder: (context, snapshot) {
                  if (snapshot.loaded) {
                    return AnimatedSwitcher(
                      child: Image(
                        image: MemoryImage(snapshot.data as Uint8List),
                        fit: BoxFit.fitHeight,
                        width: 76,
                        height: 76,
                      ),
                      duration: const Duration(milliseconds: shortAnim),
                    );
                  } else if (snapshot.hasError) {
                    return AnimatedSwitcher(
                        child: ExceptionWidget(
                            message: AppLocalizations.of(context)?.generalException),
                        duration: const Duration(milliseconds: shortAnim));
                  } else {
                    return AnimatedSwitcher(
                      child: Container(
                        width: 76,
                        height: 76,
                        padding: const EdgeInsets.all(marginSmall),
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator.adaptive(),
                      ),
                      duration: const Duration(milliseconds: shortAnim),
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
