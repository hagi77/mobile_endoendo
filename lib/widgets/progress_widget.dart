import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/values.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
          child: Column(children: [
        const Padding(
            padding: EdgeInsets.all(marginRegular), child: CircularProgressIndicator.adaptive()),
        Text(AppLocalizations.of(context)?.generalLoading ?? "")
      ]));
}
