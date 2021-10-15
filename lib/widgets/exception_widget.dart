import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExceptionWidget extends StatelessWidget {
  String? message;

  ExceptionWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(message ?? AppLocalizations.of(context)?.generalException ?? ""),
      );
}
