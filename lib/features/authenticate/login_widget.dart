import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/widgets/exception_widget.dart';
import 'package:mobile_endoendo/widgets/progress_widget.dart';

import 'login_view_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State createState() => _LoginWidgetState();
}

class _LoginWidgetState extends BaseWidgetState<LoginWidget, LoginViewModel> {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: viewModel.signInWithGoogle(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ExceptionWidget(message: AppLocalizations.of(context)?.loginError ?? "");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && (snapshot.data as UserCredential).user != null) {
            Navigator.pushNamed(context, '/');
          } else {
            return ExceptionWidget(message: AppLocalizations.of(context)?.loginError ?? "");
          }
        }

        return const ProgressWidget();
      });
}
