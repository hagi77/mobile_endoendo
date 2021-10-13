import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExceptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Text(AppLocalizations.of(context)?.generalException ?? ""),
      );
}
