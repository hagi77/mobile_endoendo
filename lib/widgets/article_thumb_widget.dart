import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_endoendo/core/values.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/features/guide/article_widget.dart';

class ArticleThumbnailWidget extends StatelessWidget {
  final ArticleUiModel _uiModel;

  const ArticleThumbnailWidget(this._uiModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ArticleWidget.routeName, arguments: _uiModel);
      },
      child: Card(
        child: Row(
          children: [
            const Image(
              image: AssetImage('lib/images/placeholder.jpg'),
              fit: BoxFit.fitHeight,
              width: 76,
              height: 76,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(
                        marginMedium, marginSmall, marginSmall, marginSmall),
                    child: Text(
                      _uiModel.title,
                      style: Theme.of(context).textTheme.headline3,
                      maxLines: 1,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(marginMedium, 0, marginSmall, marginSmall),
                    child: Text(
                      _uiModel.subtitle,
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
