import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';

class ArticleThumbnailWidget extends StatelessWidget {
  final ArticleUiModel _uiModel;

  const ArticleThumbnailWidget(this._uiModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Row(
          children: [
            const Image(
              image: AssetImage('lib/images/placeholder.jpg'),
              fit: BoxFit.fitHeight,
              width: 68,
              height: 68,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(
                        marginMedium, marginSmall, marginSmall, marginTiny),
                    child: Text(
                      _uiModel.title,
                      style: Theme.of(context).textTheme.headline3,
                      maxLines: 1,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(
                        marginMedium, marginTiny, marginSmall, marginSmall),
                    child: Text(_uiModel.subtitle,
                        style: Theme.of(context).textTheme.bodyText2,
                        maxLines: 2))
              ],
            )),
            const Icon(Icons.navigate_next),
          ],
        ),
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Colors.black,
                width: outlineThickness,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(outlineRadius)),
        clipBehavior: Clip.hardEdge,
        elevation: 0,
      );
}
