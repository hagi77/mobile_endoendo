import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_endoendo/core/values.dart';

class ArticleThumbnailWidget extends StatelessWidget {
  String _thumbnailUrl;

  String _title;

  String _subtitle;

  ArticleThumbnailWidget(
      String this._thumbnailUrl, String this._title, String this._subtitle);

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
                      _title,
                      style: Theme.of(context).textTheme.headline3,
                      maxLines: 1,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(
                        marginMedium, marginTiny, marginSmall, marginSmall),
                    child: Text(_subtitle,
                        style: Theme.of(context).textTheme.bodyText2,
                        maxLines: 2))
              ],
            )),
            Icon(Icons.navigate_next),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.hardEdge,
      );
}
